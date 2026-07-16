'use strict';
const $ = (id) => document.getElementById(id);
const TOKEN_KEY = 'cb_token';
let RESET_TOKEN = '';        // set when arriving from a password-reset link
let CAN_EMAIL_RESET = true;  // whether the server can send reset email at all
let token = localStorage.getItem(TOKEN_KEY) || '';
const API_BASE = (window.CB_API || '').replace(/\/$/, ''); // base URL of the Capital Book API
let me = null;

// Contacts CSV import is restricted server-side (POST /contacts/import) to this
// one account, not just any admin. Mirrored here so the Import button doesn't
// invite a 403 for every other admin.
const SUPER_ADMIN_EMAIL = 'admin@capitalbook.local';

const SEG_COLORS = {
  'Financial Advisor':'#3E6FA8','Pension Fund':'#B08D2E','Sovereign Wealth Fund':'#8A6B1F',
  'Family Office':'#1C7A57','Consultant / OCIO':'#7A4FA0','Endowment / Foundation':'#2C6EA8','Platform / FoF / Seeder':'#0E7C86',
  'Insurance General Account':'#5E548E','Healthcare / Nonprofit':'#2A8C7A','Placement Agent / Cap Intro':'#C0632E',
  'RIA / Private Bank / MFO':'#9A6A4F','Venture Capital / Growth':'#B0436E','Private Equity / Buyout':'#6E7B3D',
  'Investment Bank / M&A Advisory':'#A85751','Private Credit / Direct Lending':'#4E6E54','Multi-Manager / Quant Fund':'#7E2E3E',
  'Fund Service Provider / Launch':'#5A5A5A'
};
const STATUS_OPTS = ['New','Contacted','Replied','Meeting','Passed'];
const STATUS_COLORS = {New:'#8a93a1',Contacted:'#2C6EA8',Replied:'#B08D2E',Meeting:'#1C7A57',Passed:'#B0442E'};

function fmtAum(mm){ if(mm==null) return '—'; if(mm>=1e6) return '$'+(mm/1e6).toFixed(mm>=1e7?1:2)+'T'; if(mm>=1000){const b=mm/1000;return '$'+(b>=100?Math.round(b):b.toFixed(1))+'B';} return '$'+Math.round(mm)+'M'; }
function fmtBig(mm){ if(!mm) return '$0'; const b=mm/1000; if(b>=1000) return '$'+(b/1000).toFixed(1)+'T'; return '$'+(b>=10?Math.round(b):b.toFixed(1))+'B'; }
function esc(s){ return String(s==null?'':s).replace(/[&<>"]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c])); }

async function api(path, opts={}){
  const headers = Object.assign({'Content-Type':'application/json'}, opts.headers||{});
  if(token) headers['Authorization'] = 'Bearer '+token;
  const res = await fetch(API_BASE+'/api'+path, Object.assign({}, opts, { headers }));
  let body=null; try{ body=await res.json(); }catch{ /* no body */ }
  if(!res.ok) throw Object.assign(new Error((body&&body.error)||('HTTP '+res.status)), { status:res.status, body });
  return body;
}

// ---------- auth ----------
let registerMode = false;
$('liToggle').onclick = () => {
  registerMode = !registerMode;
  $('liBtn').textContent = registerMode ? 'Create account' : 'Sign in';
  $('liToggleText').textContent = registerMode ? 'Have an account?' : 'No account?';
  $('liToggle').textContent = registerMode ? 'Sign in' : 'Create one';
  $('liErr').textContent = '';
};
$('liBtn').onclick = doAuth;
$('liPass').addEventListener('keydown', e => { if(e.key==='Enter') doAuth(); });

async function doAuth(){
  $('liErr').textContent='';
  const email=$('liEmail').value.trim(), password=$('liPass').value;
  if(!email||!password){ $('liErr').textContent='Enter email and password.'; return; }
  try{
    const path = registerMode ? '/auth/register' : '/auth/login';
    const r = await api(path, { method:'POST', body: JSON.stringify({ email, password }) });
    token = r.token; localStorage.setItem(TOKEN_KEY, token); me = r.user;
    enterApp();
  }catch(e){
    $('liErr').textContent = e.status===401 ? 'Invalid email or password.' :
      e.status===409 ? 'That email is already registered.' :
      e.status===400 ? 'Password must be at least 8 characters.' : (e.message||'Sign-in failed.');
  }
}

$('logoutBtn').onclick = () => { token=''; me=null; localStorage.removeItem(TOKEN_KEY); $('app').classList.remove('show'); $('login').style.display='flex'; };

// ---------- app init ----------
async function enterApp(){
  $('login').style.display='none'; $('app').classList.add('show');
  $('userEmail').textContent = me.email; $('userRole').textContent = me.role;
  const canEdit = me.role==='admin'||me.role==='editor';
  CAN_EDIT = canEdit;
  $('importBtn').classList.toggle('hidden', (me.email||'').toLowerCase()!==SUPER_ADMIN_EMAIL);
  $('newBtn').classList.toggle('hidden', !canEdit);
  if(me.mustChange){
    FORCE_PW = true;
    $('acctModal').classList.remove('hidden');
    $('acctClose').style.visibility='hidden';
    pwMsg('This is a temporary password. Set your own to continue.', true);
  }
  $('tplBtn').classList.toggle('hidden', !canEdit);
  $('usersBtn').classList.toggle('hidden', me.role!=='admin');
  $('auditBtn').classList.toggle('hidden', me.role!=='admin');
  $('selAll').style.visibility = canEdit ? 'visible' : 'hidden';
  if(canEdit && $('bulkStatus').options.length<=1){ STATUS_OPTS.forEach(s=>{ const o=document.createElement('option'); o.value=s; o.textContent=s; $('bulkStatus').appendChild(o); }); }
  await loadMeta();
  $('fCountry').value = state.country; $('fSeg').value = state.segment;
  await loadGeo();
  loadTagFilter(); loadViews(); loadMembers();
  resetAndLoad();
  refreshTaskBadge();
}

async function loadMeta(){
  const m = await api('/contacts/meta');
  const fill=(sel,arr)=>{ arr.forEach(v=>{ const o=document.createElement('option'); o.value=v; o.textContent=v; sel.appendChild(o); }); };
  fill($('fSeg'), m.segments); fill($('fPri'), m.priorities); fill($('fTier'), m.tiers);
  fill($('fSource'), m.sources || []);
  fill($('ncSeg'), m.segments || []);
  fill($('fFirmType'), m.firmTypes || []);
  fill($('fEmailStatus'), m.emailStatuses || []);
  STATUS_OPTS.forEach(s=>{ const o=document.createElement('option'); o.value=s; o.textContent=s; $('fStatus').appendChild(o); });
}

// ---------- list ----------
// Country and segment default to Canada / Financial Advisor on every fresh load —
// the desk's most common working view — rather than starting unfiltered.
const state = { q:'', segment:'Financial Advisor', priority:'', country:'Canada', state:'', city:'', tier:'', status:'', tag:'', owner:'', source:'', firmtype:'', emailstatus:'', reachable:false, foundation:false, uhnw:false, institutional:false, flag:false, due:false, noemail:false, nopipeline:false, sort:'a', dir:'desc', page:1 };
const selected = new Set();
let CAN_EDIT = false;
let FORCE_PW = false;   // true while a temporary password must be replaced
let totalPages = 1;

function buildQuery(){
  const p = new URLSearchParams();
  if(state.q) p.set('q', state.q);
  for(const k of ['segment','priority','country','state','city','tier','status','tag','owner','source','firmtype','emailstatus']) if(state[k]) p.set(k, state[k]);
  for(const k of ['reachable','uhnw','institutional','foundation','flag','due','noemail','nopipeline']) if(state[k]) p.set(k,'true');
  p.set('sort', state.sort); p.set('dir', state.dir);
  p.set('page', String(state.page)); p.set('pageSize','60');
  return p.toString();
}

async function loadPage(append){
  const data = await api('/contacts?'+buildQuery());
  $('resCount').textContent = data.total.toLocaleString();
  if(window.updateFilterCount) window.updateFilterCount();
  totalPages = data.pages;
  const rowsEl = $('rows');
  if(!append) rowsEl.innerHTML='';
  data.rows.forEach(r => rowsEl.appendChild(rowEl(r)));
  $('empty').classList.toggle('hidden', data.total>0);
  $('loadmore').classList.toggle('hidden', state.page>=totalPages || data.total===0);
}

function rowEl(r){
  const d=document.createElement('div'); d.className='row';
  const col=SEG_COLORS[r.segment]||'#888';
  const loc=[r.city, r.state||r.country].filter(Boolean).join(', ');
  const pr=r.priority||'D';
  let statusCell='';
  if(r.pipe_status){ statusCell=`<span class="stat" style="background:${STATUS_COLORS[r.pipe_status]||'#888'}22;color:${STATUS_COLORS[r.pipe_status]||'#888'}">${r.pipe_status}</span>`; }
  d.innerHTML =
    `<div class="selcell">${CAN_EDIT?`<input type="checkbox" class="rowchk" data-id="${r.id}">`:''}</div>`+
    `<div><div class="nmrow"><div class="nm">${esc(r.name)}</div>${r.owner_email?`<span class="ownpill" title="Owner: ${esc(r.owner_name||r.owner_email)}">${esc(initials(r.owner_name||r.owner_email))}</span>`:''}</div><div class="fm">${esc(r.firm)}</div></div>`+
    `<div><span class="seg" style="background:${col}">${esc(r.segment)}</span></div>`+
    `<div class="loc">${esc(loc)}</div>`+
    `<div class="aum">${fmtAum(r.aum_mm)}</div>`+
    `<div class="pri p${pr}">${esc(pr)}</div>`+
    `<div style="text-align:center">${statusCell}</div>`;
  d.onclick=()=>openDetail(r.id);
  if(CAN_EDIT){
    const cell=d.querySelector('.selcell'); cell.onclick=(e)=>e.stopPropagation();
    const chk=d.querySelector('.rowchk'); chk.checked=selected.has(r.id);
    chk.onchange=()=>toggleSelect(r.id, chk.checked);
  }
  return d;
}

let searchTimer=null;
$('q').addEventListener('input', e => { clearTimeout(searchTimer); searchTimer=setTimeout(()=>{ state.q=e.target.value.trim(); resetAndLoad(); }, 250); });
$('fSeg').onchange=e=>{ state.segment=e.target.value; resetAndLoad(); };
$('fPri').onchange=e=>{ state.priority=e.target.value; resetAndLoad(); };
$('fCountry').onchange=async e=>{
  state.country=e.target.value;
  state.state='';                      // a province from the old country would filter to nothing
  state.city='';
  await loadGeo();
  resetAndLoad();
};
$('fState').onchange=async e=>{
  state.state=e.target.value;
  state.city='';                       // a city outside the new state would filter to nothing
  await loadCities();
  resetAndLoad();
};
$('fCity').onchange=e=>{ state.city=e.target.value; resetAndLoad(); };
$('fTier').onchange=e=>{ state.tier=e.target.value; resetAndLoad(); };
$('fStatus').onchange=e=>{ state.status=e.target.value; resetAndLoad(); };
$('fTag').onchange=e=>{ state.tag=e.target.value; resetAndLoad(); };
$('fOwner').onchange=e=>{ state.owner=e.target.value; resetAndLoad(); };
$('fSource').onchange=e=>{ state.source=e.target.value; resetAndLoad(); };
$('fFirmType').onchange=e=>{ state.firmtype=e.target.value; resetAndLoad(); };
$('fEmailStatus').onchange=e=>{ state.emailstatus=e.target.value; resetAndLoad(); };
$('fFound').onchange=e=>{ state.foundation=e.target.checked; resetAndLoad(); };
$('fNoEmail').onchange=e=>{ state.noemail=e.target.checked; resetAndLoad(); };
$('fNoPipe').onchange=e=>{ state.nopipeline=e.target.checked; resetAndLoad(); };
$('fReach').onchange=e=>{ state.reachable=e.target.checked; resetAndLoad(); };
$('fUhnw').onchange=e=>{ state.uhnw=e.target.checked; resetAndLoad(); };
$('fInst').onchange=e=>{ state.institutional=e.target.checked; resetAndLoad(); };
$('fFlag').onchange=e=>{ state.flag=e.target.checked; resetAndLoad(); };
$('fDue').onchange=e=>{ state.due=e.target.checked; resetAndLoad(); };
$('sortSel').onchange=e=>{ state.sort=e.target.value; resetAndLoad(); };
$('dirBtn').onclick=()=>{ state.dir = state.dir==='desc'?'asc':'desc'; $('dirBtn').textContent=state.dir; resetAndLoad(); };
$('resetBtn').onclick=()=>{
  // Country has no "all countries" option any more (Canada/USA/Other always cover
  // everything), so a reset returns it to the default bucket instead of blanking it.
  Object.assign(state,{q:'',segment:'',priority:'',country:'Canada',state:'',city:'',tier:'',status:'',tag:'',owner:'',source:'',firmtype:'',emailstatus:'',reachable:false,uhnw:false,institutional:false,foundation:false,flag:false,due:false,noemail:false,nopipeline:false,page:1});
  $('q').value=''; ['fSeg','fPri','fTier','fStatus','fTag','fOwner','fSource','fFirmType','fEmailStatus'].forEach(id=>$(id).value='');
  $('fCountry').value='Canada';
  loadGeo();
  ['fReach','fUhnw','fInst','fFound','fFlag','fDue','fNoEmail','fNoPipe'].forEach(id=>$(id).checked=false);
  loadPage(false);
};
$('loadmoreBtn').onclick=()=>{ state.page++; loadPage(true); };
function resetAndLoad(){ state.page=1; clearSelection(); loadPage(false); }

// ---------- detail drawer + pipeline ----------
function closeDrawer(){ $('drawer').classList.remove('show'); $('overlay').classList.remove('show'); }
$('overlay').onclick=closeDrawer;

async function openDetail(id){
  const { contact:c, pipeline:pipe, tags=[], owner=null } = await api('/contacts/'+id);
  const canEdit = me && (me.role==='admin' || me.role==='editor');
  const col=SEG_COLORS[c.segment]||'#888';
  const field=(l,v)=> v ? `<div class="dr-field"><label>${l}</label><div>${esc(v)}</div></div>` : '';
  const p = pipe || { status:'New', due:'', opp:'', poc:'', note:'' };
  const statusBtns = STATUS_OPTS.map(s=>`<button class="sbtn ${p.status===s?'on':''}" data-s="${s}" style="${p.status===s?('background:'+STATUS_COLORS[s]):''}">${s}</button>`).join('');
  let pipeHtml;
  if(canEdit){
    pipeHtml =
      `<div class="pipe"><h4>Pipeline</h4>
        <div class="statuses" id="statuses">${statusBtns}</div>
        <label>Follow-up date</label><input type="date" id="pDue" value="${esc(p.due||'')}">
        <label>Opportunity size ($mm)</label><input type="number" id="pOpp" min="0" value="${p.opp!=null?p.opp:''}">
        <label>Point of contact</label><input type="text" id="pPoc" value="${esc(p.poc||'')}" placeholder="Person you are dealing with">
        <label>Notes</label><textarea id="pNote" placeholder="Notes">${esc(p.note||'')}</textarea>
        <button class="save" id="pSave">Save to pipeline</button>
        <div class="savemsg" id="pMsg"></div></div>`;
  } else {
    pipeHtml = `<div class="pipe"><h4>Pipeline</h4><div class="ro">Status: <b>${esc(p.status)}</b>. Your role is read-only; ask an editor or admin for write access.</div></div>`;
  }
  $('drawer').innerHTML =
    `<div class="dr-head"><button class="dr-close" id="drClose">&times;</button>
       <div class="dr-name">${esc(c.name)}${canEdit?'<button class=\"dr-name-edit\" id=\"drNameEdit\" title=\"Edit name\" aria-label=\"Edit name\">&#9998;</button>':''}</div><div class="dr-firm">${esc(c.title)}${c.title&&c.firm?' · ':''}${esc(c.firm)}</div>
       <div class="dr-seg"><span class="seg" style="background:${col}">${esc(c.segment)}</span></div>
       <div id="drTags" class="dr-tags"></div>
       <div class="dr-actions"><button class="dr-act" id="drVcf">Save .vcf</button><button class="dr-act" id="drBrief">Print brief</button><button class="dr-act" id="drCompose">Compose email</button>${canEdit?'<button class="dr-act" id="drTag">+ Tag</button>':''}${canEdit?'<button class="dr-act" id="drEdit">Edit</button>':''}</div>
       <div id="drOwner" class="dr-owner"></div></div>
     <div class="dr-body">
       <div class="dr-grid">
         ${field('Email', c.email)} ${field('Email status', c.email_status)}
         ${field('Phone', c.phone)} ${field('Location', [c.address,c.city,c.state,c.country].filter(Boolean).join(', '))}
         ${field('AUM', fmtAum(c.aum_mm))} ${field('Tier', c.aum_tier)}
         ${field('Firm type', c.firm_type)} ${field('Priority', c.priority)}
         ${field('Source', c.source_list)} ${field('Client types', c.client_types)}
       </div>
       ${c.data_flags ? `<div class="dr-flag">${esc(c.data_flags)}</div>` : ''}
       <div class="ppl">
         <h4>People at this firm</h4>
         <div id="drPeople" class="ppl-list"></div>
         ${canEdit ? `<div class="ppl-add">
           <input id="ppName" placeholder="Name">
           <input id="ppRole" placeholder="Role (assistant, branch manager...)">
           <input id="ppEmail" type="email" placeholder="Email">
           <input id="ppPhone" placeholder="Phone">
           <button id="ppAdd" class="sf-btn primary">Add</button>
         </div>` : ''}
         <div id="ppMsg" class="sf-msg"></div>
       </div>
       ${pipeHtml}
       <div id="actsWrap"></div>
     </div>`;
  $('drClose').onclick=closeDrawer;
  $('drVcf').onclick=()=>downloadVcf(c);
  $('drBrief').onclick=()=>printBrief(c.id);
  loadPeople(c.id, canEdit);
  if(canEdit){
    let chosen=p.status;
    $('statuses').querySelectorAll('.sbtn').forEach(b=>{ b.onclick=()=>{
      chosen=b.dataset.s;
      $('statuses').querySelectorAll('.sbtn').forEach(x=>{ x.classList.remove('on'); x.style.background=''; });
      b.classList.add('on'); b.style.background=STATUS_COLORS[chosen];
    }; });
    $('pSave').onclick=async()=>{
      const payload={ status:chosen, due:$('pDue').value||null,
        opp:$('pOpp').value!==''?Number($('pOpp').value):null, poc:$('pPoc').value, note:$('pNote').value };
      try{ await api('/pipeline/'+id, { method:'PUT', body:JSON.stringify(payload) });
        $('pMsg').textContent='Saved. Synced to your account.'; loadPage(false);
      }catch(e){ $('pMsg').style.color='#B0442E'; $('pMsg').textContent=e.message||'Save failed'; }
    };
    if($('drEdit')) $('drEdit').onclick=()=>enterEditMode(c);
    if($('drNameEdit')) $('drNameEdit').onclick=()=>enterEditMode(c);
  }
  loadActivities(id);
  renderDrawerTags(id, tags, canEdit);
  renderOwner(id, owner);
  $('drCompose').onclick=()=>openCompose(c);
  if(canEdit && $('drTag')) $('drTag').onclick=async()=>{
    const name=prompt('Add tag'); if(!name||!name.trim()) return;
    const r=await api('/contacts/'+id+'/tags',{method:'POST',body:JSON.stringify({name:name.trim()})});
    renderDrawerTags(id, r.tags||[], canEdit); loadTagFilter();
  };
  $('drawer').classList.add('show'); $('overlay').classList.add('show');
}

// ---------- dashboard ----------
$('dashBtn').onclick=openDash;
$('dashClose').onclick=()=>$('dash').classList.add('hidden');
$('dash').onclick=e=>{ if(e.target===$('dash')) $('dash').classList.add('hidden'); };
// Escape closes whatever is open. This used to be a hardcoded list of modal ids,
// which silently missed every modal added afterwards (Account, Audit). Selecting
// on the class means new modals are covered automatically.
document.addEventListener('keydown',e=>{ if(e.key==='Escape'){ document.querySelectorAll('.modal').forEach(m=>{ if(FORCE_PW && m.id==='acctModal') return; m.classList.add('hidden'); }); closeDrawer(); } });

async function openDash(){
  const d = await api('/dashboard/stats');
  $('dTotal').textContent=d.total.toLocaleString(); $('dSeg').textContent=d.segments; $('dCo').textContent=d.countries;
  const total=d.total;
  const segRows = d.bySegment.map(s=>{
    const col=SEG_COLORS[s.segment]||'#888'; const pct=(100*s.count/total).toFixed(s.count/total<0.1?1:0);
    return `<tr><td><span class="dot" style="background:${col}"></span>${esc(s.segment)}</td>`+
      `<td style="text-align:right">${s.count.toLocaleString()}</td>`+
      `<td style="text-align:right;color:#6b7787">${pct}%</td>`+
      `<td style="text-align:right">${s.aum_sum?fmtBig(s.aum_sum):'—'}</td></tr>`;
  }).join('');
  const TORD=['Mega ($10B+)','Large ($2B–10B)','Mid ($500M–2B)','Boutique (<$500M)','Unknown'];
  const tierMap={}; d.byTier.forEach(t=>tierMap[t.tier]=t.count);
  const tierRows=TORD.filter(t=>tierMap[t]).map(t=>`<tr><td>${t}</td><td style="text-align:right">${tierMap[t].toLocaleString()}</td></tr>`).join('');
  const g=d.geography;
  const geoRows=`<tr><td>United States</td><td style="text-align:right">${(g.us||0).toLocaleString()}</td></tr>`+
    `<tr><td>Canada</td><td style="text-align:right">${(g.canada||0).toLocaleString()}</td></tr>`+
    `<tr><td>International (${g.intl_countries} countries)</td><td style="text-align:right">${(g.intl||0).toLocaleString()}</td></tr>`;
  const psMap={}; d.pipeline.byStatus.forEach(s=>psMap[s.status]=s.count);
  const pipeRows=STATUS_OPTS.map(s=>`<tr><td><span class="dot" style="border-radius:50%;background:${STATUS_COLORS[s]}"></span>${s}</td><td style="text-align:right">${(psMap[s]||0).toLocaleString()}</td></tr>`).join('');
  $('dashBody').innerHTML=
    `<div class="dgrid">
      <div class="dcard wide"><h4>By segment</h4><table><thead><tr><td>Segment</td><td style="text-align:right">Records</td><td style="text-align:right">Share</td><td style="text-align:right">AUM (sum)</td></tr></thead><tbody>${segRows}</tbody></table></div>
      <div class="dcard"><h4>By AUM tier</h4><table><tbody>${tierRows}</tbody></table></div>
      <div class="dcard"><h4>Geography</h4><table><tbody>${geoRows}</tbody></table></div>
      <div class="dcard"><h4>My pipeline</h4><table><tbody>${pipeRows}</tbody></table>
        <div style="margin-top:9px;padding-top:8px;border-top:1px solid #e6e3da;font-size:11.5px;color:#4a5563">${d.pipeline.tracked.toLocaleString()} tracked · <b>${fmtBig(d.pipeline.openOpp)}</b> open opportunity<br>${(d.tasks?d.tasks.open:0)} open tasks${d.tasks&&d.tasks.overdue?` · <b style="color:#B0442E">${d.tasks.overdue} overdue</b>`:''} · ${d.activity7d||0} activities this week</div></div>
    </div>`;
  $('dash').classList.remove('hidden');
}

// ---------- boot ----------
(async function boot(){
  const resetToken = new URLSearchParams(location.search).get('reset');
  if(resetToken){
    RESET_TOKEN = resetToken;
    history.replaceState({}, '', location.pathname);   // keep the token out of history
    showLoginView('reset');
    $('login').style.display='flex';
    return;
  }
  if(token){
    try{ const r=await api('/auth/me'); me=r.user; await enterApp(); return; }
    catch{ token=''; localStorage.removeItem(TOKEN_KEY); }
  }
  $('login').style.display='flex';
  applyPolicy();
})();

async function applyPolicy(){
  try{
    const p = await api('/auth/policy');
    $('liRegWrap').classList.toggle('hidden', !p.allowRegistration);
    CAN_EMAIL_RESET = !!p.canEmailReset;
  }catch(e){}
}

// ========== increment 2: export, tasks, import, activities, contact edit ==========

// ---- CSV export (filtered set, authenticated) ----
async function exportCsv(){
  try{
    const res = await fetch(API_BASE+'/api/contacts/export.csv?'+buildQuery(), { headers:{ Authorization:'Bearer '+token } });
    if(!res.ok) throw new Error('HTTP '+res.status);
    const blob = await res.blob();
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a'); a.href=url; a.download='capital-book-export.csv';
    document.body.appendChild(a); a.click(); a.remove(); URL.revokeObjectURL(url);
  }catch(e){ alert('Export failed: '+(e.message||e)); }
}
$('exportBtn').onclick=exportCsv;

// ---- tasks ----
let taskFilter='open';
function fmtDue(d){ if(!d) return ''; const od = d < new Date().toISOString().slice(0,10); return `<span class="${od?'od':''}">${od?'overdue ':''}due ${d}</span>`; }
async function refreshTaskBadge(){
  try{ const d=await api('/tasks?status=open'); const open=d.counts.open||0, over=d.counts.overdue||0;
    const b=$('taskBadge'); b.textContent=open; b.classList.toggle('hidden', open===0); b.classList.toggle('over', over>0);
  }catch{}
}
async function openTasks(){ $('taskAddWrap').style.display=(me.role==='admin'||me.role==='editor')?'flex':'none'; await loadTasks(); $('tasksModal').classList.remove('hidden'); }
async function loadTasks(){
  const d = await api('/tasks'+(taskFilter?('?status='+taskFilter):''));
  $('tOpen').textContent=d.counts.open||0; $('tOver').textContent=d.counts.overdue||0; $('tDone').textContent=d.counts.done||0;
  const list=$('taskList'), canEdit=me.role==='admin'||me.role==='editor';
  if(!d.tasks.length){ list.innerHTML='<div class="task-empty">No tasks here.</div>'; return; }
  list.innerHTML='';
  d.tasks.forEach(t=>{
    const el=document.createElement('div'); el.className='tk'+(t.done?' is-done':'');
    const meta=[t.contact_name?esc(t.contact_name):'', fmtDue(t.due)].filter(Boolean).join(' · ');
    el.innerHTML=`${canEdit?`<input type="checkbox" ${t.done?'checked':''}>`:''}<div class="tk-main"><div class="tk-title">${esc(t.title)}</div><div class="tk-meta">${meta}</div></div>${canEdit?'<button class="tk-del" title="Delete">&times;</button>':''}`;
    if(canEdit){
      el.querySelector('input').onchange=async(e)=>{ await api('/tasks/'+t.id,{method:'PATCH',body:JSON.stringify({done:e.target.checked})}); await loadTasks(); refreshTaskBadge(); };
      el.querySelector('.tk-del').onclick=async()=>{ await api('/tasks/'+t.id,{method:'DELETE'}); await loadTasks(); refreshTaskBadge(); };
    }
    list.appendChild(el);
  });
}
$('tasksBtn').onclick=openTasks;
$('tasksClose').onclick=()=>$('tasksModal').classList.add('hidden');
$('tasksModal').onclick=e=>{ if(e.target===$('tasksModal')) $('tasksModal').classList.add('hidden'); };
$('taskTabs').querySelectorAll('.tab').forEach(b=>{ b.onclick=()=>{ $('taskTabs').querySelectorAll('.tab').forEach(x=>x.classList.remove('on')); b.classList.add('on'); taskFilter=b.dataset.f; loadTasks(); }; });
$('taskAddBtn').onclick=async()=>{
  const title=$('taskTitle').value.trim(); if(!title) return;
  await api('/tasks',{method:'POST',body:JSON.stringify({title, due:$('taskDue').value||null})});
  $('taskTitle').value=''; $('taskDue').value=''; await loadTasks(); refreshTaskBadge();
};

// ---- import (admin) ----
$('importBtn').onclick=()=>{ $('importMsg').textContent=''; $('importMsg').style.color=''; $('importModal').classList.remove('hidden'); };
$('importClose').onclick=()=>$('importModal').classList.add('hidden');
$('importModal').onclick=e=>{ if(e.target===$('importModal')) $('importModal').classList.add('hidden'); };
$('importRun').onclick=async()=>{
  const raw=$('importText').value.trim(); if(!raw) return;
  let payload;
  if(raw[0]==='[' || raw[0]==='{'){
    let arr; try{ arr=JSON.parse(raw); }catch{ $('importMsg').style.color='#B0442E'; $('importMsg').textContent='Looks like JSON but did not parse.'; return; }
    if(!Array.isArray(arr)){ $('importMsg').style.color='#B0442E'; $('importMsg').textContent='Expected a JSON array.'; return; }
    payload={contacts:arr};
  } else { payload={csv:raw}; }
  try{ const r=await api('/contacts/import',{method:'POST',body:JSON.stringify(payload)});
    $('importMsg').style.color='#1C7A57'; $('importMsg').textContent=`Imported ${r.imported}. Database now holds ${r.total.toLocaleString()}.`;
    loadMetaRefresh(); loadPage(false);
  }catch(e){ $('importMsg').style.color='#B0442E'; $('importMsg').textContent=e.message||'Import failed'; }
};
async function loadMetaRefresh(){
  // fCountry is a fixed Canada/USA/Other list, not populated from meta — leave it alone here.
  ['fSeg','fTier'].forEach(id=>{ const s=$(id); const keep=s.options[0]; s.innerHTML=''; s.appendChild(keep); });
  try{ const m=await api('/contacts/meta');
    const fill=(sel,arr)=>arr.forEach(v=>{const o=document.createElement('option');o.value=v;o.textContent=v;$(sel).appendChild(o);});
    fill('fSeg',m.segments); fill('fTier',m.tiers);
  }catch{}
}

// ---- activities timeline (drawer) ----
async function loadActivities(contactId){
  const wrap=$('actsWrap'); if(!wrap) return;
  const canEdit = me && (me.role==='admin'||me.role==='editor');
  let data; try{ data=await api('/contacts/'+contactId+'/activities'); }catch{ return; }
  const addForm = canEdit ? `
    <div class="act-add">
      <div class="row1"><select id="actType"><option value="note">Note</option><option value="call">Call</option><option value="email">Email</option><option value="meeting">Meeting</option></select></div>
      <textarea id="actBody" placeholder="Log a note, call, email, or meeting"></textarea>
      <button id="actAdd">Log activity</button>
    </div>` : '';
  const items = data.activities.length ? data.activities.map(a=>{
    const when=(a.created_at||'').replace('T',' ').slice(0,16);
    return `<div class="act"><div class="pin act-${a.type}">${esc(a.type[0])}</div><div class="act-b"><div class="act-body">${esc(a.body)}</div><div class="act-meta">${esc(a.type)} · ${esc(a.user_email||'')} · ${when}</div></div></div>`;
  }).join('') : '<div class="act-empty">No activity logged yet.</div>';
  wrap.innerHTML = `<div class="acts"><h4>Activity</h4>${addForm}<div id="actList">${items}</div></div>`;
  if(canEdit){
    $('actAdd').onclick=async()=>{
      const body=$('actBody').value.trim(); if(!body) return;
      await api('/contacts/'+contactId+'/activities',{method:'POST',body:JSON.stringify({type:$('actType').value, body})});
      $('actBody').value=''; loadActivities(contactId);
    };
  }
}

// ---- contact edit mode (editors) ----
const EDIT_FIELDS=[['name','Name'],['title','Title'],['firm','Firm'],['segment','Segment'],['priority','Priority'],['email','Email'],['email_status','Email status'],['phone','Phone'],['address','Address'],['city','City'],['state','State / Province'],['country','Country'],['aum_mm','AUM ($mm)'],['aum_tier','AUM tier'],['firm_type','Firm type'],['source_list','Source']];
function enterEditMode(c){
  const grid=$('drawer').querySelector('.dr-grid'); if(!grid) return;
  const segOpts=['',...Object.keys(SEG_COLORS)];
  const inputFor=(k)=>{
    if(k==='segment') return `<select data-k="segment">${segOpts.map(s=>`<option ${s===c.segment?'selected':''}>${esc(s)}</option>`).join('')}</select>`;
    if(k==='aum_mm') return `<input data-k="aum_mm" type="number" value="${c.aum_mm!=null?c.aum_mm:''}">`;
    return `<input data-k="${k}" type="text" value="${esc(c[k]||'')}">`;
  };
  const form=document.createElement('div');
  form.innerHTML=`<div class="edit-grid">${EDIT_FIELDS.map(([k,l])=>`<div class="ef"><label>${l}</label>${inputFor(k)}</div>`).join('')}</div><button class="save" id="cSave">Save contact</button><div class="savemsg" id="cMsg"></div>`;
  grid.replaceWith(form);
  const eb=$('drEdit'); if(eb) eb.style.display='none';
  const nb=$('drNameEdit'); if(nb) nb.style.display='none';
  $('cSave').onclick=async()=>{
    const payload={};
    form.querySelectorAll('[data-k]').forEach(el=>{ payload[el.dataset.k]= el.type==='number' ? (el.value!==''?Number(el.value):null) : el.value; });
    try{ await api('/contacts/'+c.id,{method:'PATCH',body:JSON.stringify(payload)});
      $('cMsg').textContent='Saved.'; loadPage(false); setTimeout(()=>openDetail(c.id), 350);
    }catch(e){ $('cMsg').style.color='#B0442E'; $('cMsg').textContent=e.message||'Save failed'; }
  };
}

// ========== increment 3: tags, saved views, compose/mail-merge, templates ==========

// ---- contact tag chips (drawer) ----
function renderDrawerTags(contactId, tags, canEdit){
  const el=$('drTags'); if(!el) return;
  el.innerHTML = (tags||[]).map(t=>`<span class="tagchip" style="background:${t.color}1a;color:${t.color};border-color:${t.color}55">${esc(t.name)}${canEdit?` <b data-tag="${t.id}" title="Remove">×</b>`:''}</span>`).join('');
  if(canEdit) el.querySelectorAll('b[data-tag]').forEach(b=>{ b.onclick=async()=>{
    await api('/contacts/'+contactId+'/tags/'+b.dataset.tag,{method:'DELETE'});
    const d=await api('/contacts/'+contactId); renderDrawerTags(contactId, d.tags||[], canEdit); loadTagFilter();
  }; });
}

// ---- tag filter dropdown ----
async function loadTagFilter(){
  try{ const d=await api('/tags'); const sel=$('fTag'); const cur=state.tag; const keep=sel.options[0];
    sel.innerHTML=''; sel.appendChild(keep);
    d.tags.forEach(t=>{ const o=document.createElement('option'); o.value=t.id; o.textContent=`${t.name} (${t.count})`; sel.appendChild(o); });
    sel.value=cur||'';
  }catch{}
}

// ---- saved views ----
let VIEWS=[];
// Every filter the sidebar can set. This used to save only six of them, so a view
// saved as "Canada / Ontario / Toronto" came back as "Canada", and the dropped
// filters were not cleared either, which let a view apply stale ones silently.
const VIEW_KEYS = ['segment','priority','country','state','city','tier','status','tag','owner','source','firmtype','emailstatus'];
const VIEW_FLAGS = ['reachable','uhnw','institutional','foundation','flag','due','noemail','nopipeline'];

function filterQuery(){
  const p=new URLSearchParams();
  if(state.q)p.set('q',state.q);
  for(const k of VIEW_KEYS) if(state[k]) p.set(k,state[k]);
  for(const k of VIEW_FLAGS) if(state[k]) p.set(k,'true');
  p.set('sort',state.sort); p.set('dir',state.dir);
  return p.toString();
}
async function loadViews(){
  try{ const d=await api('/views'); VIEWS=d.views; const sel=$('viewSel'); const keep=sel.options[0];
    sel.innerHTML=''; sel.appendChild(keep);
    d.views.forEach(v=>{ const o=document.createElement('option'); o.value=v.id; o.textContent=v.name+(v.shared&&!v.mine?' (shared)':''); sel.appendChild(o); });
  }catch{}
}
async function applyViewQuery(qs){
  const p=new URLSearchParams(qs);
  // clear everything first, so a filter absent from the view cannot survive from
  // whatever was on screen a moment ago
  VIEW_KEYS.forEach(k=>state[k]='');
  VIEW_FLAGS.forEach(k=>state[k]=false);
  state.q = p.get('q')||'';
  VIEW_KEYS.forEach(k=>state[k]=p.get(k)||'');
  VIEW_FLAGS.forEach(k=>state[k]=p.get(k)==='true');
  if(p.get('sort'))state.sort=p.get('sort');
  if(p.get('dir'))state.dir=p.get('dir');

  $('q').value=state.q;
  $('fSeg').value=state.segment; $('fPri').value=state.priority; $('fCountry').value=state.country;
  $('fTier').value=state.tier; $('fStatus').value=state.status; $('fTag').value=state.tag;
  $('fOwner').value=state.owner; $('fSource').value=state.source;
  $('fFirmType').value=state.firmtype; $('fEmailStatus').value=state.emailstatus;
  VIEW_FLAGS.forEach(k=>{ const el=$({reachable:'fReach',uhnw:'fUhnw',institutional:'fInst',foundation:'fFound',flag:'fFlag',due:'fDue',noemail:'fNoEmail',nopipeline:'fNoPipe'}[k]); if(el) el.checked=state[k]; });
  $('sortSel').value=state.sort; $('dirBtn').textContent=state.dir;

  // the province and city dropdowns hold only the values under the chosen
  // country, so they have to be rebuilt before their values can be selected
  await loadGeo();
  $('fState').value=state.state||'';
  $('fCity').value=state.city||'';

  resetAndLoad();
}
$('viewSel').onchange=async e=>{ const v=VIEWS.find(x=>String(x.id)===e.target.value); if(v) await applyViewQuery(v.query); };
$('saveViewBtn').onclick=async()=>{
  const name=prompt('Name this view'); if(!name||!name.trim()) return;
  const shared=confirm('Share with the whole team?  OK = shared, Cancel = private');
  try{ await api('/views',{method:'POST',body:JSON.stringify({name:name.trim(), query:filterQuery(), shared})}); loadViews(); }
  catch(e){ alert(e.message||'Save failed'); }
};

// ---- compose / mail merge ----
async function openCompose(c){
  $('composeWho').textContent = `${c.name}${c.firm?' · '+c.firm:''}`;
  $('composeTo').value=c.email||''; $('composeSubject').value=''; $('composeBody').value=''; $('composeMsg').textContent='';
  const sel=$('composeTpl'); const keep=sel.options[0]; sel.innerHTML=''; sel.appendChild(keep);
  try{ const d=await api('/templates'); d.templates.forEach(t=>{ const o=document.createElement('option'); o.value=t.id; o.textContent=t.name; sel.appendChild(o); }); }catch{}
  sel.onchange=async()=>{ if(!sel.value) return;
    try{ const r=await api('/templates/'+sel.value+'/render',{method:'POST',body:JSON.stringify({contactId:c.id})});
      if(r.to) $('composeTo').value=r.to; $('composeSubject').value=r.subject; $('composeBody').value=r.body;
    }catch(e){ $('composeMsg').style.color='#B0442E'; $('composeMsg').textContent=e.message||'Render failed'; }
  };
  $('composeModal').classList.remove('hidden');
}
$('composeClose').onclick=()=>$('composeModal').classList.add('hidden');
$('composeModal').onclick=e=>{ if(e.target===$('composeModal')) $('composeModal').classList.add('hidden'); };
$('composeCopy').onclick=async()=>{
  const text=`Subject: ${$('composeSubject').value}\n\n${$('composeBody').value}`;
  try{
    if(navigator.clipboard&&navigator.clipboard.writeText){ await navigator.clipboard.writeText(text); }
    else { const ta=document.createElement('textarea'); ta.value=text; document.body.appendChild(ta); ta.select(); try{document.execCommand('copy');}catch{} ta.remove(); }
    $('composeMsg').style.color='#1C7A57'; $('composeMsg').textContent='Copied to clipboard.';
  }catch{ $('composeMsg').style.color='#B0442E'; $('composeMsg').textContent='Copy not available; select and copy manually.'; }
};
$('composeMail').onclick=()=>{
  const to=encodeURIComponent($('composeTo').value), su=encodeURIComponent($('composeSubject').value), bo=encodeURIComponent($('composeBody').value);
  window.location.href=`mailto:${to}?subject=${su}&body=${bo}`;
};

// ---- templates manager ----
let curTpl=0;
function clearTplForm(){ $('tplName').value=''; $('tplSubject').value=''; $('tplBody').value=''; $('tplMsg').textContent=''; }
async function loadTplList(){
  const d=await api('/templates'); const list=$('tplList'); list.innerHTML='';
  if(!d.templates.length){ list.innerHTML='<div class="task-empty" style="padding:14px">No templates yet.</div>'; return; }
  d.templates.forEach(t=>{ const el=document.createElement('div'); el.className='tpl-item'+(t.id===curTpl?' on':''); el.textContent=t.name;
    el.onclick=()=>{ curTpl=t.id; $('tplName').value=t.name; $('tplSubject').value=t.subject||''; $('tplBody').value=t.body||''; $('tplMsg').textContent=''; loadTplList(); };
    list.appendChild(el); });
}
async function openTpl(){ curTpl=0; clearTplForm(); await loadTplList(); $('tplModal').classList.remove('hidden'); }
$('tplBtn').onclick=openTpl;
$('tplClose').onclick=()=>$('tplModal').classList.add('hidden');
$('tplModal').onclick=e=>{ if(e.target===$('tplModal')) $('tplModal').classList.add('hidden'); };
$('tplNew').onclick=()=>{ curTpl=0; clearTplForm(); loadTplList(); };
$('tplSave').onclick=async()=>{
  const payload={ name:$('tplName').value.trim(), subject:$('tplSubject').value, body:$('tplBody').value };
  if(!payload.name){ $('tplMsg').style.color='#B0442E'; $('tplMsg').textContent='Name is required.'; return; }
  try{ if(curTpl){ await api('/templates/'+curTpl,{method:'PATCH',body:JSON.stringify(payload)}); }
       else { const r=await api('/templates',{method:'POST',body:JSON.stringify(payload)}); curTpl=r.template.id; }
    $('tplMsg').style.color='#1C7A57'; $('tplMsg').textContent='Saved.'; loadTplList();
  }catch(e){ $('tplMsg').style.color='#B0442E'; $('tplMsg').textContent=e.message||'Save failed'; }
};
$('tplDel').onclick=async()=>{
  if(!curTpl){ clearTplForm(); return; }
  try{ await api('/templates/'+curTpl,{method:'DELETE'}); curTpl=0; clearTplForm(); loadTplList(); }
  catch(e){ $('tplMsg').style.color='#B0442E'; $('tplMsg').textContent=e.message||'Delete failed'; }
};

// ========== increment 4: bulk operations + users ==========
function flashBulk(msg, err){
  const t=document.createElement('div'); t.className='toast'+(err?' err':''); t.textContent=msg;
  document.body.appendChild(t); setTimeout(()=>t.remove(), 2600);
}
function toggleSelect(id, on){ if(on) selected.add(id); else selected.delete(id); updateBulkBar(); }
function clearSelection(){ selected.clear(); const sa=$('selAll'); if(sa) sa.checked=false; document.querySelectorAll('#rows .rowchk').forEach(c=>{ c.checked=false; }); updateBulkBar(); }
function updateBulkBar(){
  const bar=$('bulkBar'); if(!bar) return;
  if(CAN_EDIT && selected.size>0){ bar.classList.remove('hidden'); $('bulkCount').textContent=selected.size; }
  else bar.classList.add('hidden');
}
$('selAll').onchange=()=>{
  const on=$('selAll').checked;
  document.querySelectorAll('#rows .rowchk').forEach(chk=>{ chk.checked=on; const id=Number(chk.dataset.id); if(on) selected.add(id); else selected.delete(id); });
  updateBulkBar();
};
async function runBulk(payload, label){
  const ids=[...selected]; if(!ids.length) return;
  try{ const r=await api('/contacts/bulk',{method:'POST',body:JSON.stringify({ids, ...payload})});
    clearSelection(); loadTagFilter(); refreshTaskBadge(); loadPage(false);
    flashBulk(`${label}: ${r.affected} contact${r.affected===1?'':'s'}`);
  }catch(e){ flashBulk(e.message||'Bulk action failed', true); }
}
$('bulkStatus').onchange=()=>{ const s=$('bulkStatus').value; if(!s) return; runBulk({action:'pipeline', status:s}, 'Status set to '+s); $('bulkStatus').value=''; };
$('bulkTagBtn').onclick=()=>{ const name=prompt('Tag name to add to the selected contacts'); if(!name||!name.trim()) return; runBulk({action:'tag', name:name.trim()}, 'Tagged'); };
$('bulkTaskBtn').onclick=()=>{ const title=prompt('Task title to create for each selected contact'); if(!title||!title.trim()) return; runBulk({action:'task', title:title.trim()}, 'Tasks created'); };
$('bulkClear').onclick=()=>clearSelection();

// ---- admin: users panel ----
async function openUsers(){ await loadUsers(); $('usersModal').classList.remove('hidden'); }
async function loadUsers(){
  const d=await api('/auth/users'); const list=$('usersList'); list.innerHTML='';
  d.users.forEach(u=>{
    const row=document.createElement('div'); row.className='urow';
    const isMe = me && u.email===me.email;
    row.innerHTML=`<div class="uinfo"><div class="uname">${esc(u.name||u.email)}</div><div class="uemail">${esc(u.email)}</div></div>`+
      (isMe?'<span class="ume">you</span>':`<select data-uid="${u.id}"><option value="viewer">viewer</option><option value="editor">editor</option><option value="admin">admin</option></select>`)+
      `<button class="urow-act" data-act="pw">Set password</button>`+
      (isMe?'':`<button class="urow-act danger" data-act="del">Remove</button>`);
    list.appendChild(row);
    if(!isMe){ const sel=row.querySelector('select'); sel.value=u.role; sel.onchange=async()=>{
      try{ await api('/auth/users/'+u.id+'/role',{method:'PATCH',body:JSON.stringify({role:sel.value})}); uMsg(`${u.email} is now ${sel.value}`); }
      catch(e){ uMsg(e.message||'Update failed', true); sel.value=u.role; }
    }; }
    row.querySelector('[data-act="pw"]').onclick=async()=>{
      const pw=prompt(`Set a new password for ${u.email} (at least 8 characters). Give it to them directly; they can change it under Account.`);
      if(!pw) return;
      try{ await api('/auth/users/'+u.id+'/password',{method:'POST',body:JSON.stringify({password:pw})}); uMsg(`Password set for ${u.email}.`); }
      catch(e){ uMsg(e.message||'Could not set that password.', true); }
    };
    const delBtn=row.querySelector('[data-act="del"]');
    if(delBtn) delBtn.onclick=async()=>{
      if(!confirm(`Remove ${u.email}? Contacts they own become unowned, and their pipeline entries are deleted. This cannot be undone.`)) return;
      try{ await api('/auth/users/'+u.id,{method:'DELETE'}); uMsg(`${u.email} removed.`); await loadUsers(); }
      catch(e){ uMsg(e.message||'Could not remove that user.', true); }
    };
  });
}
$('usersBtn').onclick=openUsers;
$('usersClose').onclick=()=>$('usersModal').classList.add('hidden');
$('usersModal').onclick=e=>{ if(e.target===$('usersModal')) $('usersModal').classList.add('hidden'); };

// ========== increment 5: ownership + team activity feed ==========
function initials(s){ const parts=String(s||'').replace(/@.*/,'').split(/[\s._-]+/).filter(Boolean); return ((parts[0]||'')[0]||'')+((parts[1]||'')[0]||'')||(String(s||'?')[0]||'?'); }

let MEMBERS=[]; let MY_ID=0;
async function loadMembers(){
  if(!CAN_EDIT) return;
  try{ const d=await api('/auth/members'); MEMBERS=d.members;
    const mine=MEMBERS.find(m=>m.email===me.email); MY_ID=mine?mine.id:0;
    // owner filter: keep first three base options, append members
    const fo=$('fOwner'); while(fo.options.length>3) fo.remove(3);
    MEMBERS.forEach(m=>{ const o=document.createElement('option'); o.value=m.id; o.textContent=m.name||m.email; fo.appendChild(o); });
    // bulk assign options
    const ba=$('bulkAssign'); ba.innerHTML='<option value="">Assign owner…</option>'+(MY_ID?'<option value="me">Assign to me</option>':'')+'<option value="none">Unassign</option>'+MEMBERS.map(m=>`<option value="${m.id}">${esc(m.name||m.email)}</option>`).join('');
  }catch{}
}
function renderOwner(contactId, owner){
  const el=$('drOwner'); if(!el) return;
  if(CAN_EDIT){
    const opts=['<option value="">Unassigned</option>'].concat(MEMBERS.map(m=>`<option value="${m.id}">${esc(m.name||m.email)}</option>`)).join('');
    el.innerHTML=`<span class="ownlbl">Owner</span><select id="ownerSel">${opts}</select>`;
    const sel=$('ownerSel'); sel.value=owner?String(owner.id):'';
    sel.onchange=async()=>{
      const ownerId=sel.value?Number(sel.value):null;
      try{ const r=await api('/contacts/'+contactId+'/owner',{method:'PUT',body:JSON.stringify({ownerId})});
        flashBulk(ownerId?('Assigned to '+(r.owner.name||r.owner.email)):'Unassigned'); loadPage(false);
      }catch(e){ flashBulk(e.message||'Assign failed', true); }
    };
  } else {
    el.innerHTML = owner?`<span class="owntext">Owned by ${esc(owner.name||owner.email)}</span>`:`<span class="owntext muted">Unassigned</span>`;
  }
}
$('bulkAssign').onchange=()=>{
  const v=$('bulkAssign').value; if(v==='') return;
  const ownerId = v==='none'?null:(v==='me'?MY_ID:Number(v));
  runBulk({action:'assign', ownerId}, ownerId?'Assigned':'Unassigned');
  $('bulkAssign').value='';
};

// ---- team activity feed ----
async function openFeed(){ await loadFeed(); $('feedModal').classList.remove('hidden'); }
async function loadFeed(){
  const list=$('feedList');
  let d; try{ d=await api('/activity?limit=50'); }catch(e){ list.innerHTML='<div class="feed-empty">Could not load the feed.</div>'; return; }
  if(!d.activities.length){ list.innerHTML='<div class="feed-empty">No activity logged yet.</div>'; return; }
  list.innerHTML='';
  d.activities.forEach(a=>{
    const when=(a.created_at||'').replace('T',' ').slice(0,16);
    const who=(a.user_email||'').replace(/@.*/,'');
    const el=document.createElement('div'); el.className='feed-item';
    el.innerHTML=`<div class="pin act-${a.type}">${esc((a.type||'n')[0])}</div>`+
      `<div class="fmain"><div class="fline"><b>${esc(who)}</b> logged a ${esc(a.type)} on <b>${esc(a.contact_name||'a contact')}</b>${a.contact_firm?` · ${esc(a.contact_firm)}`:''}</div>`+
      `<div class="fbody">${esc(a.body)}</div><div class="fmeta">${when}</div></div>`;
    if(a.contact_id) el.style.cursor='pointer', el.onclick=()=>{ $('feedModal').classList.add('hidden'); openDetail(a.contact_id); };
    list.appendChild(el);
  });
}
$('feedBtn').onclick=openFeed;
$('feedClose').onclick=()=>$('feedModal').classList.add('hidden');
$('feedModal').onclick=e=>{ if(e.target===$('feedModal')) $('feedModal').classList.add('hidden'); };

// ---------- password reset (sign-in screen) ----------
function loginMsg(err, ok){
  $('liErr').textContent = err || '';
  $('liOk').textContent = ok || '';
}
function showLoginView(view){
  loginMsg('', '');
  $('liMain').classList.toggle('hidden', view!=='main');
  $('liForgot').classList.toggle('hidden', view!=='forgot');
  $('liReset').classList.toggle('hidden', view!=='reset');
}
$('liForgotLink').onclick = ()=>{ $('fpEmail').value = $('liEmail').value.trim(); showLoginView('forgot'); };
$('fpBack').onclick = ()=>showLoginView('main');
$('rsBack').onclick = ()=>{ RESET_TOKEN=''; showLoginView('main'); };

$('fpBtn').onclick = async()=>{
  const email = $('fpEmail').value.trim();
  if(!email){ loginMsg('Enter your email address.'); return; }
  loginMsg('', 'Sending...');
  try{
    const r = await api('/auth/forgot', { method:'POST', body: JSON.stringify({ email }) });
    loginMsg('', r.message || 'If that address has an account, a reset link is on its way.');
  }catch(e){
    loginMsg(e.message || 'Could not send a reset link.');
  }
};
$('fpEmail').addEventListener('keydown', e=>{ if(e.key==='Enter') $('fpBtn').click(); });

$('rsBtn').onclick = async()=>{
  const a = $('rsPass').value, b = $('rsPass2').value;
  if(a.length < 8){ loginMsg('Password must be at least 8 characters.'); return; }
  if(a !== b){ loginMsg('Those passwords do not match.'); return; }
  try{
    await api('/auth/reset', { method:'POST', body: JSON.stringify({ token: RESET_TOKEN, password: a }) });
    RESET_TOKEN=''; $('rsPass').value=''; $('rsPass2').value='';
    showLoginView('main');
    loginMsg('', 'Password updated. Sign in with your new password.');
  }catch(e){
    loginMsg(e.message || 'That reset link is invalid or has expired.');
  }
};
$('rsPass2').addEventListener('keydown', e=>{ if(e.key==='Enter') $('rsBtn').click(); });

// ---------- account: change your own password ----------
function pwMsg(t, err){ const m=$('pwMsg'); m.textContent=t||''; m.className='sf-msg'+(t?(err?' err':' ok'):''); }
$('acctBtn').onclick = ()=>{
  pwMsg('');
  $('acctInfo').textContent = me ? `${me.email} \u00b7 ${me.role}` : '';
  ['pwCur','pwNew','pwConf'].forEach(id=>$(id).value='');
  $('acctModal').classList.remove('hidden');
};
$('acctClose').onclick = ()=>{ if(FORCE_PW) return; $('acctModal').classList.add('hidden'); };
$('acctModal').onclick = e=>{ if(FORCE_PW) return; if(e.target===$('acctModal')) $('acctModal').classList.add('hidden'); };
$('pwSave').onclick = async()=>{
  const cur=$('pwCur').value, nw=$('pwNew').value, cf=$('pwConf').value;
  if(!cur){ pwMsg('Enter your current password.', true); return; }
  if(nw.length<8){ pwMsg('New password must be at least 8 characters.', true); return; }
  if(nw!==cf){ pwMsg('Those passwords do not match.', true); return; }
  try{
    await api('/auth/password', { method:'POST', body: JSON.stringify({ currentPassword: cur, newPassword: nw }) });
    ['pwCur','pwNew','pwConf'].forEach(id=>$(id).value='');
    pwMsg('Password updated.');
    if(FORCE_PW){
      FORCE_PW=false; me.mustChange=false;
      $('acctClose').style.visibility='';
      setTimeout(()=>$('acctModal').classList.add('hidden'), 600);
    }
  }catch(e){ pwMsg(e.message || 'Could not update password.', true); }
};

// ---------- admin: add and remove users ----------
function uMsg(t, err){ const m=$('uMsg'); m.textContent=t||''; m.className='sf-msg'+(t?(err?' err':' ok'):''); }
$('uaAdd').onclick = async()=>{
  const name=$('uaName').value.trim(), email=$('uaEmail').value.trim(),
        password=$('uaPass').value, role=$('uaRole').value;
  if(!email || password.length<8){ uMsg('Email and a password of at least 8 characters are required.', true); return; }
  try{
    await api('/auth/users', { method:'POST', body: JSON.stringify({ name, email, password, role }) });
    ['uaName','uaEmail','uaPass'].forEach(id=>$(id).value='');
    uMsg(`${email} added as ${role}.`);
    await loadUsers();
  }catch(e){ uMsg(e.message || 'Could not add that user.', true); }
};

// ---------- geography cascade: country -> province/state -> city ----------
// 54 US states and 550 cities across the book, so each list is scoped to what
// sits above it. Nothing below Country is selectable until a country is chosen,
// and changing a level clears everything under it, so a stale filter can never
// silently return zero rows.

function setSel(sel, placeholder, items, chosen){
  sel.innerHTML = '';
  sel.appendChild(new Option(placeholder, ''));
  (items || []).forEach(i => sel.appendChild(new Option(`${i.name} (${i.count})`, i.name)));
  sel.disabled = !items || !items.length;
  sel.value = chosen || '';
}

// city list depends on the country and, when set, the province/state
async function loadCities(){
  const sel = $('fCity');
  if(!state.country){
    sel.innerHTML=''; sel.appendChild(new Option('Select a country first',''));
    sel.disabled = true; sel.value=''; return;
  }
  sel.disabled = true;
  try{
    const p = new URLSearchParams({ country: state.country });
    if(state.state) p.set('state', state.state);
    const m = await api('/contacts/meta?' + p.toString());
    if(m.cities === undefined){
      sel.innerHTML=''; sel.appendChild(new Option('API is out of date, restart it',''));
      sel.disabled = true; sel.value='';
      console.warn('Capital Book: /contacts/meta returned no "cities" key. The API is running an older build than this frontend.');
      return;
    }
    const scope = state.state || state.country;
    setSel(sel, `All cities in ${scope}`, m.cities, state.city);
  }catch(e){
    sel.innerHTML=''; sel.appendChild(new Option('Could not load cities',''));
    sel.disabled = true;
  }
}

// refresh both levels below Country
async function loadGeo(){
  const st = $('fState');
  if(!state.country){
    st.innerHTML=''; st.appendChild(new Option('Select a country first',''));
    st.disabled = true; st.value='';
    await loadCities();
    return;
  }
  st.disabled = true;
  try{
    const m = await api('/contacts/meta?country=' + encodeURIComponent(state.country));
    if(m.states === undefined){
      // The API answered, but with no `states` key at all. That is not a data
      // problem, it is an out-of-date backend still serving the old /meta shape.
      st.innerHTML=''; st.appendChild(new Option('API is out of date, restart it',''));
      st.disabled = true; st.value='';
      console.warn('Capital Book: /contacts/meta returned no "states" key. The API is running an older build than this frontend. Redeploy and restart the backend.');
    } else if(!m.states.length){
      // The API is current; this country genuinely has no province recorded.
      st.innerHTML=''; st.appendChild(new Option(`No provinces recorded for ${state.country}`,''));
      st.disabled = true; st.value='';
    } else {
      setSel(st, `All provinces in ${state.country}`, m.states, state.state);
    }
  }catch(e){
    st.innerHTML=''; st.appendChild(new Option('Could not load provinces',''));
    st.disabled = true;
  }
  await loadCities();
}

// ---------- people at the firm (assistants, associates, branch managers) ----------
function ppMsg(t, err){ const m=$('ppMsg'); if(!m) return; m.textContent=t||''; m.className='sf-msg'+(t?(err?' err':' ok'):''); }

async function loadPeople(contactId, canEdit){
  const wrap = $('drPeople');
  if(!wrap) return;
  try{
    const d = await api('/contacts/'+contactId+'/people');
    if(!d.people.length){
      wrap.innerHTML = '<div class="ppl-empty">Nobody else recorded yet. Add the assistant, the associate, or whoever else you deal with here.</div>';
    } else {
      wrap.innerHTML = d.people.map(pn=>{
        const bits = [pn.role, pn.phone].filter(Boolean).join(' \u00b7 ');
        return `<div class="ppl-row" data-pid="${pn.id}">`+
          `<div class="ppl-main"><div class="ppl-name">${esc(pn.name)}</div>`+
          (bits?`<div class="ppl-meta">${esc(bits)}</div>`:'')+
          (pn.email?`<a class="ppl-email" href="mailto:${esc(pn.email)}">${esc(pn.email)}</a>`:'')+
          `</div>`+
          (canEdit?`<button class="ppl-del" data-pid="${pn.id}" title="Remove">&times;</button>`:'')+
        `</div>`;
      }).join('');
      if(canEdit){
        wrap.querySelectorAll('.ppl-del').forEach(b=>{
          b.onclick = async()=>{
            const pid = b.dataset.pid;
            if(!confirm('Remove this person?')) return;
            try{ await api('/contacts/'+contactId+'/people/'+pid, {method:'DELETE'});
                 await loadPeople(contactId, canEdit); ppMsg('Removed.'); }
            catch(e){ ppMsg(e.message||'Could not remove.', true); }
          };
        });
      }
    }
  }catch(e){ wrap.innerHTML = '<div class="ppl-empty">Could not load people.</div>'; }

  const addBtn = $('ppAdd');
  if(addBtn){
    addBtn.onclick = async()=>{
      const name=$('ppName').value.trim(), role=$('ppRole').value.trim(),
            email=$('ppEmail').value.trim(), phone=$('ppPhone').value.trim();
      if(!name){ ppMsg('A name is required.', true); return; }
      try{
        await api('/contacts/'+contactId+'/people', {method:'POST', body: JSON.stringify({name, role, email, phone})});
        ['ppName','ppRole','ppEmail','ppPhone'].forEach(id=>$(id).value='');
        await loadPeople(contactId, canEdit);
        ppMsg(`${name} added.`);
      }catch(e){ ppMsg(e.message||'Could not add that person.', true); }
    };
  }
}

// ---------- mobile shell: nav sheet, filter sheet, active-filter count ----------
// The desktop rail and topbar do not fit a phone. Below 860px both become
// slide-in sheets sharing one scrim, and the list rows reflow into cards (CSS).
(function mobileShell(){
  const nav = $('tbActions'), filters = $('filters'), scrim = $('scrim');
  if(!nav || !filters || !scrim) return;
  // The topbar runs out of room around 1250px, well before the table does, so the
  // nav sheet appears earlier than the rest of the mobile layout. Keep this in
  // step with the @media(max-width:1250px) tier in app.css.
  const NAV_BREAK = 1250;

  function closeAll(){
    nav.classList.remove('open');
    filters.classList.remove('open');
    scrim.classList.remove('show');
    $('navBtn').setAttribute('aria-expanded','false');
    document.body.style.overflow = '';
  }
  function open(panel){
    closeAll();
    panel.classList.add('open');
    scrim.classList.add('show');
    document.body.style.overflow = 'hidden';   // stop the list scrolling behind the sheet
    if(panel === nav) $('navBtn').setAttribute('aria-expanded','true');
  }

  $('navBtn').onclick  = () => nav.classList.contains('open') ? closeAll() : open(nav);
  $('filtBtn').onclick = () => filters.classList.contains('open') ? closeAll() : open(filters);
  $('filtClose').onclick = closeAll;
  scrim.onclick = closeAll;
  document.addEventListener('keydown', e => { if(e.key === 'Escape') closeAll(); });

  // tapping any action in the nav sheet should close it, or the modal opens behind
  nav.querySelectorAll('.tb-btn').forEach(b => b.addEventListener('click', () => {
    if(window.innerWidth <= NAV_BREAK) setTimeout(closeAll, 60);
  }));

  // back to desktop: make sure nothing is left stuck open
  let wasNarrow = window.innerWidth <= NAV_BREAK;
  window.addEventListener('resize', () => {
    const narrow = window.innerWidth <= NAV_BREAK;
    if(wasNarrow && !narrow) closeAll();   // never leave a sheet stuck open on a wide window
    wasNarrow = narrow;
  });

  // how many filters are on, so a phone user is not filtering blind
  window.updateFilterCount = function(){
    const keys = ['segment','priority','country','state','city','tier','status','tag','owner','source','firmtype','emailstatus'];
    const bools = ['reachable','uhnw','institutional','foundation','flag','due','noemail','nopipeline'];
    let n = keys.filter(k => state[k]).length + bools.filter(k => state[k]).length;
    const el = $('filtCount');
    if(!el) return;
    el.textContent = String(n);
    el.classList.toggle('hidden', n === 0);
  };
})();


// ---------- audit log (admin) ----------
// The backend has always recorded every material action. Until now there was no
// way to read it back, which for a regulated desk is the one thing an audit
// trail must do.
let AUDIT = [];
const AUD_SENSITIVE = new Set(['admin_set_password','password_change','password_reset','delete_user','create_user','role_change','import_contacts']);

function audWhen(v){
  const d = new Date(String(v).replace(' ', 'T'));
  if(isNaN(d)) return esc(String(v));
  const pad = n => String(n).padStart(2,'0');
  return `${d.getFullYear()}-${pad(d.getMonth()+1)}-${pad(d.getDate())} ${pad(d.getHours())}:${pad(d.getMinutes())}`;
}
function audDetail(r){
  if(!r.detail) return '';
  try{
    const o = typeof r.detail === 'string' ? JSON.parse(r.detail) : r.detail;
    return Object.entries(o).map(([k,v]) => `${k}: ${v}`).join(', ');
  }catch(e){ return String(r.detail); }
}
// Resolve a human-readable label for the "On" column instead of raw "entity entity_id".
// Prefer the name the backend joined live from the entity's own table; if the row was
// since deleted, fall back to whatever name was captured in `detail` at write time.
function audOn(r){
  const resolved = r.contact_name || r.target_user_name || r.task_title || r.tag_name || r.template_name || r.view_name;
  if(resolved) return resolved;
  let detail = {};
  try{ detail = typeof r.detail === 'string' ? JSON.parse(r.detail) : (r.detail || {}); }catch(e){}
  const fallback = detail.name || detail.person || detail.title || detail.contact || detail.email || r.target_user_email;
  if(fallback) return fallback;
  if(r.entity === 'contacts' && r.entity_id) return `${r.entity_id} contacts`; // bulk actions: entity_id is a count, not an id
  return [r.entity, r.entity_id].filter(Boolean).join(' ');
}
function renderAudit(){
  const term = $('audSearch').value.trim().toLowerCase();
  const rows = AUDIT.filter(r => !term ||
    [r.user_email, r.action, r.entity, r.entity_id, audOn(r), audDetail(r)].join(' ').toLowerCase().includes(term));
  $('audRows').innerHTML = rows.length ? rows.map(r => {
    const hot = AUD_SENSITIVE.has(r.action) ? ' aud-hot' : '';
    const on = audOn(r);
    return `<tr class="${hot.trim()}">`+
      `<td class="aud-when">${audWhen(r.created_at)}</td>`+
      `<td>${esc(r.user_email || 'system')}</td>`+
      `<td><span class="aud-act${hot}">${esc(r.action)}</span></td>`+
      `<td class="aud-on">${esc(on)}</td>`+
      `<td class="aud-det">${esc(audDetail(r))}</td>`+
    `</tr>`;
  }).join('') : '<tr><td colspan="5" class="aud-empty">Nothing matches that filter.</td></tr>';
  const m = $('audMsg');
  m.textContent = `${rows.length.toLocaleString()} of ${AUDIT.length.toLocaleString()} entries`;
  m.className = 'sf-msg';
}
async function loadAudit(){
  $('audMsg').textContent = 'Loading...';
  try{
    const d = await api('/audit?limit=' + encodeURIComponent($('audLimit').value));
    AUDIT = d.audit || [];
    renderAudit();
  }catch(e){
    AUDIT = [];
    $('audRows').innerHTML = '';
    $('audMsg').textContent = e.message || 'Could not load the audit log.';
    $('audMsg').className = 'sf-msg err';
  }
}
if($('auditBtn')){
  $('auditBtn').onclick = async () => { $('auditModal').classList.remove('hidden'); await loadAudit(); };
  $('auditClose').onclick = () => $('auditModal').classList.add('hidden');
  $('auditModal').onclick = e => { if(e.target === $('auditModal')) $('auditModal').classList.add('hidden'); };
  $('audSearch').oninput = renderAudit;
  $('audLimit').onchange = loadAudit;
  $('audExport').onclick = () => {
    const esc2 = v => `"${String(v == null ? '' : v).replace(/"/g,'""')}"`;
    const head = ['when','who','action','entity','entity_id','detail'];
    const body = AUDIT.map(r => [r.created_at, r.user_email, r.action, r.entity, r.entity_id, audDetail(r)].map(esc2).join(','));
    const blob = new Blob([head.join(',') + '\n' + body.join('\n')], {type:'text/csv'});
    const a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = `capital-book-audit-${new Date().toISOString().slice(0,10)}.csv`;
    a.click();
    URL.revokeObjectURL(a.href);
  };
}

// ---------- integrations: calendar (.ics) and contact cards (.vcf) ----------
// Both are plain files generated in the browser, the same pattern as the audit
// CSV export. They open in Outlook, Apple Calendar/Contacts, and Google, with
// no server, no OAuth, and nothing to configure.

function icsEscape(v){ return String(v==null?'':v).replace(/\\/g,'\\\\').replace(/;/g,'\\;').replace(/,/g,'\\,').replace(/\r?\n/g,'\\n'); }
function icsFold(line){
  // RFC 5545: lines over 75 octets are folded with CRLF + space
  const out=[]; let l=line;
  while(l.length>73){ out.push(l.slice(0,73)); l=' '+l.slice(73); }
  out.push(l); return out.join('\r\n');
}
// pure, so it can be verified directly
function buildTasksIcs(tasks){
  const stamp = new Date().toISOString().replace(/[-:]/g,'').replace(/\.\d{3}/,'');
  const lines = ['BEGIN:VCALENDAR','VERSION:2.0','PRODID:-//Capital Book//Tasks//EN','CALSCALE:GREGORIAN'];
  for(const t of tasks){
    if(t.done || !t.due) continue;
    const day = String(t.due).slice(0,10).replace(/-/g,'');
    if(day.length!==8) continue;
    lines.push('BEGIN:VEVENT');
    lines.push('UID:task-'+t.id+'@capitalbook');
    lines.push('DTSTAMP:'+stamp);
    lines.push('DTSTART;VALUE=DATE:'+day);
    lines.push(icsFold('SUMMARY:'+icsEscape(t.title)));
    if(t.contact_name) lines.push(icsFold('DESCRIPTION:'+icsEscape('Contact: '+t.contact_name+(t.contact_firm?' ('+t.contact_firm+')':''))));
    lines.push('END:VEVENT');
  }
  lines.push('END:VCALENDAR');
  return lines.join('\r\n')+'\r\n';
}
function downloadFile(name, mime, text){
  const blob=new Blob([text],{type:mime});
  const a=document.createElement('a');
  a.href=URL.createObjectURL(blob); a.download=name; a.click();
  URL.revokeObjectURL(a.href);
}
if($('icsBtn')) $('icsBtn').onclick=async()=>{
  try{
    const d=await api('/tasks?status=open');
    const dated=(d.tasks||[]).filter(t=>t.due && !t.done);
    if(!dated.length){ alert('No open tasks with a due date to export.'); return; }
    downloadFile('capital-book-tasks.ics','text/calendar;charset=utf-8', buildTasksIcs(dated));
  }catch(e){ alert(e.message||'Could not export tasks.'); }
};

function vcfEscape(v){ return String(v==null?'':v).replace(/\\/g,'\\\\').replace(/;/g,'\\;').replace(/,/g,'\\,').replace(/\r?\n/g,'\\n'); }
// pure, so it can be verified directly
function buildVcf(c){
  const parts=(c.name||'').trim().split(/\s+/);
  const last=parts.length>1?parts.pop():''; const first=parts.join(' ');
  const lines=['BEGIN:VCARD','VERSION:3.0',
    'N:'+vcfEscape(last)+';'+vcfEscape(first)+';;;',
    'FN:'+vcfEscape(c.name||'')];
  if(c.firm) lines.push('ORG:'+vcfEscape(c.firm));
  if(c.title) lines.push('TITLE:'+vcfEscape(c.title));
  if(c.email) lines.push('EMAIL;TYPE=WORK:'+vcfEscape(c.email));
  if(c.phone) lines.push('TEL;TYPE=WORK,VOICE:'+vcfEscape(c.phone));
  if(c.address||c.city||c.state||c.country) lines.push('ADR;TYPE=WORK:;;'+vcfEscape(c.address||'')+';'+vcfEscape(c.city||'')+';'+vcfEscape(c.state||'')+';;'+vcfEscape(c.country||''));
  lines.push('NOTE:'+vcfEscape('Capital Book'+(c.segment?' · '+c.segment:'')));
  lines.push('END:VCARD');
  return lines.join('\r\n')+'\r\n';
}
function downloadVcf(c){
  const safe=(c.name||'contact').replace(/[^a-z0-9]+/gi,'-').replace(/^-+|-+$/g,'').toLowerCase();
  downloadFile(safe+'.vcf','text/vcard;charset=utf-8', buildVcf(c));
}

// ---------- command palette (Ctrl/Cmd+K) ----------
// One box that reaches everything: type a few letters to jump to any of the
// 2,444 contacts, or run an action (open tasks, export the current view, reset
// filters, admin panels). Role-aware: viewers never see admin actions.
(function palette(){
  const pal=$('palette'), input=$('palInput'), list=$('palList');
  if(!pal) return;
  let items=[], active=0, seq=0, lastQ=null;

  const ACTIONS=()=>{
    const admin = me && me.role==='admin';
    const editor = admin || (me && me.role==='editor');
    const a=[];
    if(editor) a.push({k:'+', label:'New contact', sub:'Add to the book', run:()=>$('newBtn').click()});
    a.push(
      {k:'\u2713', label: editor?'New task':'My tasks', sub:'Tasks', run:()=>{ $('tasksBtn').click(); if(editor) setTimeout(()=>{ const t=$('taskTitle'); if(t) t.focus(); },350); }},
      {k:'\u2261', label:'Activity feed', sub:'Feed', run:()=>$('feedBtn').click()},
      {k:'\u25A4', label:'Pipeline board', sub:'Drag between stages', run:()=>$('boardBtn').click()},
      {k:'\u2211', label:'Report on current view', sub:'Group and roll up', run:()=>$('repBtn').click()},
      {k:'\u25A6', label:'Dashboard', sub:'Overview', run:()=>$('dashBtn').click()},
      {k:'\u2709', label:'Email templates', sub:'Templates', run:()=>$('tplBtn').click()},
      {k:'\u2913', label:'Export current view (CSV)', sub:'Download', run:()=>$('exportBtn').click()},
      {k:'\u21BA', label:'Reset all filters', sub:'Filters', run:()=>$('resetBtn').click()},
      {k:'\u2699', label:'Account and password', sub:'Account', run:()=>$('acctBtn').click()},
    );
    if(admin){
      a.push({k:'\u2912', label:'Import contacts', sub:'Admin', run:()=>$('importBtn').click()});
      a.push({k:'\u265B', label:'Manage users', sub:'Admin', run:()=>$('usersBtn').click()});
      a.push({k:'\u2637', label:'Audit log', sub:'Admin', run:()=>$('auditBtn').click()});
    }
    a.push({k:'\u23FB', label:'Sign out', sub:'', run:()=>$('logoutBtn').click()});
    return a;
  };

  function openPal(){
    pal.classList.remove('hidden');
    input.value=''; lastQ=null;
    render('');
    setTimeout(()=>input.focus(), 20);
  }
  function closePal(){ pal.classList.add('hidden'); input.blur(); }
  window.__openPalette=openPal;   // for the hint chip

  function paint(){
    list.querySelectorAll('.pal-item').forEach((el,i)=>el.classList.toggle('active', i===active));
    const el=list.querySelectorAll('.pal-item')[active];
    if(el) el.scrollIntoView({block:'nearest'});
  }
  function draw(actions, contacts, q){
    items=[]; list.innerHTML='';
    const add=(sect, arr)=>{
      if(!arr.length) return;
      const h=document.createElement('div'); h.className='pal-sect'; h.textContent=sect; list.appendChild(h);
      for(const it of arr){
        const el=document.createElement('div'); el.className='pal-item';
        el.innerHTML=`<span class="pi-k">${it.k||'\u25CF'}</span><span>${esc(it.label)}</span><span class="pi-sub">${esc(it.sub||'')}</span>`;
        const idx=items.length;
        el.onmouseenter=()=>{ active=idx; paint(); };
        el.onclick=()=>{ closePal(); it.run(); };
        list.appendChild(el); items.push(it);
      }
    };
    add('Actions', actions);
    add('Contacts', contacts);
    if(!items.length){
      const e=document.createElement('div'); e.className='pal-empty';
      e.textContent = q ? `Nothing matches "${q}".` : 'Type to search the book.';
      list.appendChild(e);
    }
    active=0; paint();
  }
  async function render(q){
    const term=q.trim().toLowerCase();
    const actions=ACTIONS().filter(a=>!term || a.label.toLowerCase().includes(term));
    if(term.length<2){ draw(actions, [], q); return; }
    const my=++seq;
    try{
      const d=await api('/contacts?'+new URLSearchParams({q:term, pageSize:'7'}));
      if(my!==seq) return;   // a newer keystroke already answered
      const contacts=(d.rows||[]).map(r=>({
        k:'\u25CF', label:r.name, sub:[r.firm, r.city].filter(Boolean).join(' \u00b7 '),
        run:()=>openDetail(r.id),
      }));
      draw(actions, contacts, q);
    }catch(e){ if(my===seq) draw(actions, [], q); }
  }

  let deb=null;
  input.addEventListener('input', ()=>{
    const q=input.value;
    if(q===lastQ) return; lastQ=q;
    clearTimeout(deb); deb=setTimeout(()=>render(q), 160);
  });
  input.addEventListener('keydown', e=>{
    if(e.key==='Escape'){ e.stopPropagation(); closePal(); return; }   // palette only, not the drawer beneath
    if(e.key==='ArrowDown'){ e.preventDefault(); if(items.length){ active=(active+1)%items.length; paint(); } return; }
    if(e.key==='ArrowUp'){ e.preventDefault(); if(items.length){ active=(active-1+items.length)%items.length; paint(); } return; }
    if(e.key==='Enter'){ e.preventDefault(); const it=items[active]; if(it){ closePal(); it.run(); } return; }
  });
  pal.addEventListener('mousedown', e=>{ if(e.target===pal) closePal(); });

  document.addEventListener('keydown', e=>{
    if((e.ctrlKey||e.metaKey) && (e.key==='k'||e.key==='K')){
      e.preventDefault();
      if(!me) return;                                    // not signed in yet
      pal.classList.contains('hidden') ? openPal() : closePal();
    }
  });
  const hint=$('palHint');
  if(hint) hint.onclick=()=>{ if(me) openPal(); };
})();

// ---------- new contact (editor and above) ----------
(function newContact(){
  const modal=$('ncModal'); if(!modal) return;
  const F=['ncName','ncTitle','ncFirm','ncEmail','ncPhone','ncAddress','ncCity','ncState','ncCountry'];
  const open=()=>{ F.forEach(id=>$(id).value=''); $('ncSeg').value=''; $('ncPri').value=''; $('ncMsg').textContent=''; $('ncMsg').className='sf-msg';
    modal.classList.remove('hidden'); setTimeout(()=>$('ncName').focus(),30); };
  $('newBtn').onclick=open;
  $('ncClose').onclick=$('ncCancel').onclick=()=>modal.classList.add('hidden');
  modal.onclick=e=>{ if(e.target===modal) modal.classList.add('hidden'); };
  $('ncCreate').onclick=async()=>{
    const name=$('ncName').value.trim();
    if(!name){ $('ncMsg').textContent='A name is required.'; $('ncMsg').className='sf-msg err'; $('ncName').focus(); return; }
    const body={ name, title:$('ncTitle').value.trim(), firm:$('ncFirm').value.trim(), email:$('ncEmail').value.trim(),
      phone:$('ncPhone').value.trim(), address:$('ncAddress').value.trim(), city:$('ncCity').value.trim(), state:$('ncState').value.trim(),
      country:$('ncCountry').value.trim(), segment:$('ncSeg').value, priority:$('ncPri').value };
    try{
      const d=await api('/contacts',{method:'POST',body:JSON.stringify(body)});
      modal.classList.add('hidden');
      await resetAndLoad();
      openDetail(d.contact.id);          // straight into the drawer to keep filling it in
    }catch(e){ $('ncMsg').textContent=e.message||'Could not create the contact.'; $('ncMsg').className='sf-msg err'; }
  };
})();

// ---------- meeting brief: one printable page before a call ----------
async function printBrief(id){
  const el=$('printBrief'); if(!el) return;
  const [detail, peopleR, tasksR, actsR] = await Promise.all([
    api('/contacts/'+id),
    api('/contacts/'+id+'/people').catch(()=>({people:[]})),
    api('/tasks?contact_id='+id+'&status=open').catch(()=>({tasks:[]})),
    api('/contacts/'+id+'/activities').catch(()=>({activities:[]})),
  ]);
  const c=detail.contact, p=detail.pipeline, tags=detail.tags||[], owner=detail.owner;
  const people=peopleR.people||[], tasks=(tasksR.tasks||[]).filter(t=>!t.done), acts=(actsR.activities||actsR.rows||[]).slice(0,6);
  const row=(l,v)=> v?`<div><b>${l}</b> ${esc(String(v))}</div>`:'';
  const day=(v)=> v?String(v).slice(0,10):'';
  el.innerHTML =
    `<div class="pb-rule"></div>`+
    `<div class="pb-head"><h1>${esc(c.name)}</h1><p class="pb-sub">${esc([c.title,c.firm].filter(Boolean).join(' \u00b7 '))}</p></div>`+
    `<div class="pb-grid">`+
      row('Segment', c.segment)+row('Priority', c.priority)+
      row('AUM', c.aum_mm?fmtAum(c.aum_mm):'')+row('Tier', c.aum_tier)+
      row('Location', [c.address,c.city,c.state,c.country].filter(Boolean).join(', '))+row('Firm type', c.firm_type)+
      row('Email', c.email?`${c.email}${c.email_status?' ('+c.email_status+')':''}`:'')+row('Phone', c.phone)+
      row('Owner', owner?(owner.name||owner.email):'')+row('Source', c.source_list)+
      row('Tags', tags.map(t=>t.name).join(', '))+
    `</div>`+
    `<div class="pb-sect">Your pipeline</div>`+
    (p?`<div class="pb-grid">${row('Status',p.status)}${row('Next step due',day(p.due))}${row('Opportunity',p.opp?('$'+Number(p.opp).toLocaleString()+'M'):'')}${row('Point of contact',p.poc)}</div>${p.note?`<div class="pb-note">${esc(p.note)}</div>`:''}`
       :`<div class="pb-empty">Not in your pipeline yet.</div>`)+
    `<div class="pb-sect">People at the firm</div>`+
    (people.length?`<table class="pb"><tr><th>Name</th><th>Title</th><th>Email</th><th>Phone</th></tr>${people.map(x=>`<tr><td>${esc(x.name)}</td><td>${esc(x.role||'')}</td><td>${esc(x.email||'')}</td><td>${esc(x.phone||'')}</td></tr>`).join('')}</table>`
       :`<div class="pb-empty">None recorded.</div>`)+
    `<div class="pb-sect">Open tasks</div>`+
    (tasks.length?`<table class="pb">${tasks.map(t=>`<tr><td style="width:90px">${esc(day(t.due)||'\u2014')}</td><td>${esc(t.title)}</td></tr>`).join('')}</table>`
       :`<div class="pb-empty">None.</div>`)+
    `<div class="pb-sect">Recent activity</div>`+
    (acts.length?`<table class="pb">${acts.map(a=>`<tr><td style="width:90px">${esc(day(a.created_at))}</td><td>${esc(a.type||'')}</td><td>${esc(a.body||'')}</td></tr>`).join('')}</table>`
       :`<div class="pb-empty">Nothing logged yet.</div>`)+
    `<div class="pb-foot">Prepared ${new Date().toISOString().slice(0,10)} for ${esc(me?me.email:'')} \u00b7 Capital Book</div>`;
  window.print();
}

// ---------- desk report: the current view, grouped and rolled up ----------
let REP=[];
function fmtOpp(v){ const n=Number(v)||0; return n? ('$'+n.toLocaleString()+'M') : '\u2014'; }
async function loadReport(){
  const by=$('repBy').value;
  const d=await api('/contacts/report?by='+encodeURIComponent(by)+'&'+filterQuery());
  REP=d.rows||[];
  const totalC=REP.reduce((a,r)=>a+Number(r.contacts),0);
  const max=Math.max(1,...REP.map(r=>Number(r.contacts)));
  $('repScope').textContent = totalC.toLocaleString()+' contacts in the current view';
  $('repRows').innerHTML = REP.length? REP.map(r=>{
    const c=Number(r.contacts), pct=totalC? Math.round(100*c/totalC) : 0;
    return `<tr>`+
      `<td>${esc(r.bucket)}</td>`+
      `<td class="rep-num">${c.toLocaleString()} <span style="color:var(--muted)">(${pct}%)</span></td>`+
      `<td><div class="rep-track"><div class="rep-fill" style="width:${Math.round(100*c/max)}%"></div></div></td>`+
      `<td class="rep-num">${fmtAum(r.aum_mm)}</td>`+
      `<td class="rep-num">${Number(r.in_pipeline).toLocaleString()}</td>`+
      `<td class="rep-num">${fmtOpp(r.open_opp)}</td>`+
    `</tr>`;
  }).join('') : '<tr><td colspan="6" class="aud-empty">Nothing in the current view.</td></tr>';
}
if($('repBtn')){
  $('repBtn').onclick=async()=>{ $('repModal').classList.remove('hidden'); await loadReport(); };
  $('repClose').onclick=()=>$('repModal').classList.add('hidden');
  $('repModal').onclick=e=>{ if(e.target===$('repModal')) $('repModal').classList.add('hidden'); };
  $('repBy').onchange=loadReport;
  $('repCsv').onclick=()=>{
    const esc2=v=>`"${String(v==null?'':v).replace(/"/g,'""')}"`;
    const head=['group','contacts','aum_mm','in_my_pipeline','open_opp_mm'];
    const body=REP.map(r=>[r.bucket,r.contacts,r.aum_mm,r.in_pipeline,r.open_opp].map(esc2).join(','));
    downloadFile('capital-book-report-'+$('repBy').value+'.csv','text/csv;charset=utf-8',head.join(',')+'\n'+body.join('\n'));
  };
}

// ---------- pipeline board: one column per stage, drag to move ----------
async function loadBoard(){
  const canDrag = me && (me.role==='admin' || me.role==='editor');
  $('boardSub').textContent = canDrag ? 'Your pipeline, one column per stage. Drag a card to move it.'
                                      : 'Your pipeline, one column per stage.';
  const d=await api('/pipeline');
  const rows=d.pipeline||[];
  const byS={}; STATUS_OPTS.forEach(s=>byS[s]=[]);
  rows.forEach(r=>{ (byS[r.status]||(byS[r.status]=[])).push(r); });
  $('boardCols').innerHTML = STATUS_OPTS.map(st=>{
    const cards=byS[st]||[];
    const opp=cards.reduce((a,c)=>a+(Number(c.opp)||0),0);
    return `<div class="bcol" data-s="${st}">`+
      `<h4><span style="color:${STATUS_COLORS[st]||'#666'}">${st}</span><span class="bsum">${cards.length}${opp?' \u00b7 $'+opp.toLocaleString()+'M':''}</span></h4>`+
      `<div class="bcards">`+
      (cards.length? cards.map(c=>
        `<div class="bcard" ${canDrag?'draggable="true"':''} data-id="${c.contact_id}">`+
          `<div class="bn">${esc(c.name)}</div>`+
          `<div class="bf">${esc(c.firm||'')}</div>`+
          `<div class="bm">${c.opp?`<span>$${Number(c.opp).toLocaleString()}M</span>`:''}${c.due?`<span>due ${esc(String(c.due).slice(0,10))}</span>`:''}</div>`+
        `</div>`).join('') : `<div class="bempty">None</div>`)+
      `</div></div>`;
  }).join('');

  $('boardCols').querySelectorAll('.bcard').forEach(card=>{
    card.onclick=()=>{ $('boardModal').classList.add('hidden'); openDetail(Number(card.dataset.id)); };
    if(!canDrag) return;
    card.addEventListener('dragstart',e=>{ e.dataTransfer.setData('text/plain',card.dataset.id); e.dataTransfer.effectAllowed='move'; card.classList.add('dragging'); });
    card.addEventListener('dragend',()=>card.classList.remove('dragging'));
  });
  if(canDrag) $('boardCols').querySelectorAll('.bcol').forEach(col=>{
    col.addEventListener('dragover',e=>{ e.preventDefault(); col.classList.add('dragover'); });
    col.addEventListener('dragleave',()=>col.classList.remove('dragover'));
    col.addEventListener('drop',async e=>{
      e.preventDefault(); col.classList.remove('dragover');
      const id=Number(e.dataTransfer.getData('text/plain'));
      if(!id) return;
      try{
        await api('/pipeline/'+id,{method:'PUT',body:JSON.stringify({status:col.dataset.s})});
        await loadBoard();                       // re-render from the source of truth
        if(typeof resetAndLoad==='function') resetAndLoad();   // keep the list's status pills honest
      }catch(err){ alert(err.message||'Could not move the card.'); }
    });
  });
}
if($('boardBtn')){
  $('boardBtn').onclick=async()=>{ $('boardModal').classList.remove('hidden'); await loadBoard(); };
  $('boardClose').onclick=()=>$('boardModal').classList.add('hidden');
  $('boardModal').onclick=e=>{ if(e.target===$('boardModal')) $('boardModal').classList.add('hidden'); };
}

// ---------- admin: verify SMTP from inside the app ----------
if($('testMailBtn')) $('testMailBtn').onclick = async()=>{
  uMsg('Sending a test email to your address...');
  try{
    const d = await api('/auth/test-email', { method:'POST' });
    uMsg('Test email sent to ' + d.to + '. Check the inbox; "Forgot password?" is live.');
  }catch(e){ uMsg(e.message || 'Test failed.', true); }
};
