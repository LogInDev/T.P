const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const mysql = require("mysql2");

const app = express();
app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: "192.168.0.17",
  user: "foke1",
  password: "Foke1234",
  database: "mysqlhello",
});

db.connect((err) => {
  if (err) throw err;
  console.log("MySQL connected...");
});

// API 엔드포인트 설정 예제: /api/data
app.get("/api/data", (req, res) => {
  db.query("SELECT * FROM notice", (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

app.get("/search/:searchText", async (req, res) => {
  const searchText = req.params.searchText;
  // MySQL 쿼리를 작성하여 결과를 가져옵니다.
  db.query(
    "SELECT * FROM recommend WHERE search_text LIKE ?",
    [`%${searchText}%`],
    (err, results) => {
      if (err) throw err;
      res.json(results);
    }
  );
});
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

//======================
//flask 연결
// 기본 설정
