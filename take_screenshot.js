const { chromium } = require('playwright');
const path = require('path');

(async () => {
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
  const screenshotPath = path.join(__dirname, `screenshot-${timestamp}.png`);

  const browser = await chromium.launch();

  const page = await browser.newPage();

  await page.goto('http://localhost:3000');

  await page.screenshot({ path: screenshotPath, fullPage: true });
  await browser.close();

  console.log(`スクリーンショットを保存しました: ${screenshotPath}`);
})();
