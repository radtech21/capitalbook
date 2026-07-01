'use strict';
const $ = (id) => document.getElementById(id);
const TOKEN_KEY = 'cb_token';
let token = localStorage.getItem(TOKEN_KEY) || '';
const API_BASE = (window.CB_API || '').replace(/\/$/, ''); // base URL of the Capital Book API
let me = null;

const SEG_COLORS = {
  'Financial Advisor':'#3E6FA8','Advisor Team':'#6B8BB5','Pension Fund':'#B08D2E','Sovereign Wealth Fund':'#8A6B1F',
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
  $('importBtn').classList.toggle('hidden', me.role!=='admin');
  $('tplBtn').classList.toggle('hidden', !canEdit);
  $('usersBtn').classList.toggle('hidden', me.role!=='admin');
  $('selAll').style.visibility = canEdit ? 'visible' : 'hidden';
  if(canEdit && $('bulkStatus').options.length<=1){ STATUS_OPTS.forEach(s=>{ const o=document.createElement('option'); o.value=s; o.textContent=s; $('bulkStatus').appendChild(o); }); }
  await loadMeta();
  loadTagFilter(); loadViews(); loadMembers();
  resetAndLoad();
  refreshTaskBadge();
}

async function loadMeta(){
  const m = await api('/contacts/meta');
  const fill=(sel,arr)=>{ arr.forEach(v=>{ const o=document.createElement('option'); o.value=v; o.textContent=v; sel.appendChild(o); }); };
  fill($('fSeg'), m.segments); fill($('fCountry'), m.countries); fill($('fPri'), m.priorities); fill($('fTier'), m.tiers);
  STATUS_OPTS.forEach(s=>{ const o=document.createElement('option'); o.value=s; o.textContent=s; $('fStatus').appendChild(o); });
}

// ---------- list ----------
const state = { q:'', segment:'', priority:'', country:'', tier:'', status:'', tag:'', owner:'', reachable:false, uhnw:false, institutional:false, flag:false, due:false, sort:'a', dir:'desc', page:1 };
const selected = new Set();
let CAN_EDIT = false;
let totalPages = 1;

function buildQuery(){
  const p = new URLSearchParams();
  if(state.q) p.set('q', state.q);
  for(const k of ['segment','priority','country','tier','status','tag','owner']) if(state[k]) p.set(k, state[k]);
  for(const k of ['reachable','uhnw','institutional','flag','due']) if(state[k]) p.set(k,'true');
  p.set('sort', state.sort); p.set('dir', state.dir);
  p.set('page', String(state.page)); p.set('pageSize','60');
  return p.toString();
}

async function loadPage(append){
  const data = await api('/contacts?'+buildQuery());
  $('resCount').textContent = data.total.toLocaleString();
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
$('fCountry').onchange=e=>{ state.country=e.target.value; resetAndLoad(); };
$('fTier').onchange=e=>{ state.tier=e.target.value; resetAndLoad(); };
$('fStatus').onchange=e=>{ state.status=e.target.value; resetAndLoad(); };
$('fTag').onchange=e=>{ state.tag=e.target.value; resetAndLoad(); };
$('fOwner').onchange=e=>{ state.owner=e.target.value; resetAndLoad(); };
$('fReach').onchange=e=>{ state.reachable=e.target.checked; resetAndLoad(); };
$('fUhnw').onchange=e=>{ state.uhnw=e.target.checked; resetAndLoad(); };
$('fInst').onchange=e=>{ state.institutional=e.target.checked; resetAndLoad(); };
$('fFlag').onchange=e=>{ state.flag=e.target.checked; resetAndLoad(); };
$('fDue').onchange=e=>{ state.due=e.target.checked; resetAndLoad(); };
$('sortSel').onchange=e=>{ state.sort=e.target.value; resetAndLoad(); };
$('dirBtn').onclick=()=>{ state.dir = state.dir==='desc'?'asc':'desc'; $('dirBtn').textContent=state.dir; resetAndLoad(); };
$('resetBtn').onclick=()=>{
  Object.assign(state,{q:'',segment:'',priority:'',country:'',tier:'',status:'',tag:'',owner:'',reachable:false,uhnw:false,institutional:false,flag:false,due:false,page:1});
  $('q').value=''; ['fSeg','fPri','fCountry','fTier','fStatus','fTag','fOwner'].forEach(id=>$(id).value='');
  ['fReach','fUhnw','fInst','fFlag','fDue'].forEach(id=>$(id).checked=false);
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
       <div class="dr-name">${esc(c.name)}</div><div class="dr-firm">${esc(c.title)}${c.title&&c.firm?' · ':''}${esc(c.firm)}</div>
       <div class="dr-seg"><span class="seg" style="background:${col}">${esc(c.segment)}</span></div>
       <div id="drTags" class="dr-tags"></div>
       <div class="dr-actions"><button class="dr-act" id="drCompose">Compose email</button>${canEdit?'<button class="dr-act" id="drTag">+ Tag</button>':''}${canEdit?'<button class="dr-act" id="drEdit">Edit</button>':''}</div>
       <div id="drOwner" class="dr-owner"></div></div>
     <div class="dr-body">
       <div class="dr-grid">
         ${field('Email', c.email)} ${field('Email status', c.email_status)}
         ${field('Phone', c.phone)} ${field('Location', [c.city,c.state,c.country].filter(Boolean).join(', '))}
         ${field('AUM', fmtAum(c.aum_mm))} ${field('Tier', c.aum_tier)}
         ${field('Firm type', c.firm_type)} ${field('Priority', c.priority)}
         ${field('Source', c.source_list)} ${field('Client types', c.client_types)}
       </div>
       ${c.data_flags ? `<div class="dr-flag">${esc(c.data_flags)}</div>` : ''}
       ${pipeHtml}
       <div id="actsWrap"></div>
     </div>`;
  $('drClose').onclick=closeDrawer;
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
document.addEventListener('keydown',e=>{ if(e.key==='Escape'){ ['dash','tasksModal','importModal','composeModal','tplModal','usersModal','feedModal'].forEach(id=>$(id).classList.add('hidden')); closeDrawer(); } });

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
  if(token){
    try{ const r=await api('/auth/me'); me=r.user; await enterApp(); return; }
    catch{ token=''; localStorage.removeItem(TOKEN_KEY); }
  }
  $('login').style.display='flex';
})();

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
  ['fSeg','fCountry','fTier'].forEach(id=>{ const s=$(id); const keep=s.options[0]; s.innerHTML=''; s.appendChild(keep); });
  try{ const m=await api('/contacts/meta');
    const fill=(sel,arr)=>arr.forEach(v=>{const o=document.createElement('option');o.value=v;o.textContent=v;$(sel).appendChild(o);});
    fill('fSeg',m.segments); fill('fCountry',m.countries); fill('fTier',m.tiers);
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
const EDIT_FIELDS=[['name','Name'],['title','Title'],['firm','Firm'],['segment','Segment'],['priority','Priority'],['email','Email'],['email_status','Email status'],['phone','Phone'],['city','City'],['state','State / Province'],['country','Country'],['aum_mm','AUM ($mm)'],['aum_tier','AUM tier'],['firm_type','Firm type'],['source_list','Source']];
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
function filterQuery(){
  const p=new URLSearchParams();
  if(state.q)p.set('q',state.q);
  for(const k of ['segment','priority','country','tier','status','tag']) if(state[k]) p.set(k,state[k]);
  for(const k of ['reachable','uhnw','institutional','flag','due']) if(state[k]) p.set(k,'true');
  p.set('sort',state.sort); p.set('dir',state.dir);
  return p.toString();
}
async function loadViews(){
  try{ const d=await api('/views'); VIEWS=d.views; const sel=$('viewSel'); const keep=sel.options[0];
    sel.innerHTML=''; sel.appendChild(keep);
    d.views.forEach(v=>{ const o=document.createElement('option'); o.value=v.id; o.textContent=v.name+(v.shared&&!v.mine?' (shared)':''); sel.appendChild(o); });
  }catch{}
}
function applyViewQuery(qs){
  const p=new URLSearchParams(qs);
  Object.assign(state,{q:'',segment:'',priority:'',country:'',tier:'',status:'',tag:'',reachable:false,uhnw:false,institutional:false,flag:false,due:false});
  state.q=p.get('q')||''; ['segment','priority','country','tier','status','tag'].forEach(k=>state[k]=p.get(k)||'');
  ['reachable','uhnw','institutional','flag','due'].forEach(k=>state[k]=p.get(k)==='true');
  if(p.get('sort'))state.sort=p.get('sort'); if(p.get('dir'))state.dir=p.get('dir');
  $('q').value=state.q; $('fSeg').value=state.segment; $('fPri').value=state.priority; $('fCountry').value=state.country; $('fTier').value=state.tier; $('fStatus').value=state.status; $('fTag').value=state.tag;
  $('fReach').checked=state.reachable; $('fUhnw').checked=state.uhnw; $('fInst').checked=state.institutional; $('fFlag').checked=state.flag; $('fDue').checked=state.due;
  $('sortSel').value=state.sort; $('dirBtn').textContent=state.dir;
  resetAndLoad();
}
$('viewSel').onchange=e=>{ const v=VIEWS.find(x=>String(x.id)===e.target.value); if(v) applyViewQuery(v.query); };
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
      (isMe?'<span class="ume">you</span>':`<select data-uid="${u.id}"><option value="viewer">viewer</option><option value="editor">editor</option><option value="admin">admin</option></select>`);
    list.appendChild(row);
    if(!isMe){ const sel=row.querySelector('select'); sel.value=u.role; sel.onchange=async()=>{
      try{ await api('/auth/users/'+u.id+'/role',{method:'PATCH',body:JSON.stringify({role:sel.value})}); flashBulk(`${u.email} is now ${sel.value}`); }
      catch(e){ flashBulk(e.message||'Update failed', true); sel.value=u.role; }
    }; }
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
