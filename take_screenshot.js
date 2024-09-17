const { chromium } = require('playwright');

(async () => {
  const date = new Date();
  const day = date.getTime();
  // ブラウザを起動
  const browser = await chromium.launch();
  // 新しいページを作成
  const page = await browser.newPage();
  // 任意のURLに移動
  await page.goto('https://iyoshi-rgb.github.io/iyoshi.io/');
  // スクリーンショットを撮影
  await page.screenshot({ path: `screenshot${day}.png` });
  // ブラウザを閉じる
  await browser.close();
})();
