import chromium from '@sparticuz/chromium';
import puppeteer from 'puppeteer-core';
const s=(ms)=>new Promise(r=>setTimeout(r,ms));
const browser=await puppeteer.launch({args:chromium.args,executablePath:await chromium.executablePath(),headless:true});
const page=await browser.newPage();
await page.setViewport({width:390,height:844,deviceScaleFactor:2,isMobile:true,hasTouch:true});
await page.goto('http://localhost:4545/app.html',{waitUntil:'networkidle0'});
await s(700);
await page.screenshot({path:'/mnt/user-data/outputs/mobile/before-01-login.png'});
await page.type('#liEmail','jlo@ninepoint.com');
await page.type('#liPass','VerifyPass123');
await page.click('#liBtn');
await page.waitForSelector('#rows .row',{timeout:15000});
await s(900);
await page.screenshot({path:'/mnt/user-data/outputs/mobile/before-02-list.png'});
// measure the damage
const m = await page.evaluate(()=>{
  const doc = document.documentElement;
  const filters = getComputedStyle(document.querySelector('.filters')).display;
  const row = document.querySelector('#rows .row');
  const rowRect = row.getBoundingClientRect();
  const topbar = document.querySelector('.topbar');
  return {
    horizontalScroll: doc.scrollWidth > doc.clientWidth,
    pageWidth: doc.scrollWidth, viewport: doc.clientWidth,
    filtersDisplay: filters,
    rowWidth: Math.round(rowRect.width),
    topbarScrollWidth: topbar.scrollWidth,
    topbarVisibleWidth: topbar.clientWidth,
    anyFilterButton: !!document.querySelector('#filtersBtn, #mFilters'),
  };
});
console.log(JSON.stringify(m,null,1));
await page.click('#rows .row'); await s(900);
await page.screenshot({path:'/mnt/user-data/outputs/mobile/before-03-drawer.png'});
await browser.close();
