import React, { useState } from "react";
import { Form, Container, Row, Col, Button } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Index = () => {
  const [text, setText] = useState("");
  const [result, setResult] = useState(null); //New: result 상태 변수 추가
  const navigate = useNavigate();

  const handleChange = (event) => {
    setText(event.target.value);
  };

  const handleSearch = async () => {
    // New: async 키워드 추가
    try {
      const response = await axios.post("/api/process-text", {
        text,
      });
      setResult(response.data); // New: 응답 데이터를 result 상태에 저장
      navigate(`/name1/${text}`, {
        state: { resultData: response.data, selectedItemIndex: 0 },
      });
    } catch (error) {
      console.error("Error while sending text to Flask app:", error);
    }
  };

  return (
    <div className="App">
      <Container fluid="md">
        <Row>
          <Col className="MarTop" sm={8}></Col>
          <Col sm={4}></Col>
        </Row>
        <Row>
          <Col md="3"></Col>
          <Col md="6">
            <Form.Control
              className="searchtext"
              type="text"
              placeholder="마라, 중식, 커피등 카테고리로 검색해주세요."
              value={text}
              onChange={handleChange}
              onKeyDown={(event) => {
                if (event.key === "Enter") {
                  handleSearch();
                }
              }}
            />
          </Col>
          <Col md="3">
            <Button variant="flat" size="xxl" onClick={handleSearch}>
              Search
            </Button>
          </Col>
        </Row>
      </Container>
      {/* New: 결과 출력 */}
      {/* <div>
        {result && (
          <ul>
            {result.map((item, itemIndex) => (
              <li key={itemIndex}>
                {Object.entries(item).map(([key, value], index) => (
                  <div key={index}>
                    {key}: {value}
                  </div>
                ))}
              </li>
            ))}
          </ul>
        )}
      </div> */}
    </div>
  );
};

export default Index;
