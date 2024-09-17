const express = require('express');
const app = express();
const { exec } = require('child_process');
const path = require('path');

app.use(express.static(path.join(__dirname, '.')));

app.post('/take-screenshot', (req, res) => {
  exec('node take_screenshot.js', (error, stdout, stderr) => {
    if (error) {
      console.error(`エラー: ${error.message}`);
      return res.status(500).send('スクリーンショットの撮影に失敗しました');
    }
    if (stderr) {
      console.error(`標準エラー出力: ${stderr}`);
    }
    console.log(`標準出力: ${stdout}`);
    res.send('スクリーンショットを撮影しました');
  });
});

// サーバーを起動
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`サーバーがポート ${PORT} で起動しました`);
});
