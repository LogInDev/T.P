const express = require("express");
const cors = require("cors");
const app = express();
const port = 5173;

app.use(cors()); // CORS 설정 적용

app.get("/get-json-data", (req, res) => {
  // 코드 내용 작성
  res.json({}); // 반환할 JSON 데이터 작성
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
