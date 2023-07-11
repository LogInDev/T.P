import React, { useEffect, useState } from "react";
import ListGroup from "react-bootstrap/ListGroup";
import Col from "react-bootstrap/esm/Col";
import Charpage from "./Charpage";
import Row from "react-bootstrap/esm/Row";
import Container from "react-bootstrap/esm/Container";
import { useLocation, useParams } from "react-router-dom";
import axios from "axios";

const MenuBar = () => {
  const [selectedItem, setSelectedItem] = useState("");
  const [selectedIndex, setSelectedIndex] = useState(0); // 새로운 상태 변수 추가
  const [result, setResult] = useState([]);
  const location = useLocation();
  const [data, setData] = useState("");
  // useEffect(() => {
  //   fetchMySQLData();
  //   // searchText 삽입 함수 호출
  // }, [searchText]);
  //===============================================================
  //검색어 db저장
  // const fetchMySQLData = () => {
  //   const url = `http://localhost:5000/search/${searchText}`;
  //   axios
  //     .get(url)
  //     .then((response) => {
  //       const resultData = response.data.map((hit) => {
  //         const results = [
  //           hit.result_text1,
  //           hit.result_text2,
  //           hit.result_text3,
  //           hit.result_text4,
  //           hit.result_text5,
  //         ];
  //         return { ...hit, results };
  //       });
  //       console.log(resultData);
  //       setHits(resultData);
  //     })
  //     .catch((error) => {
  //       console.log(error);
  //     });
  // };
  //=====================================================================

  const handleItemClick = (name, index, data) => {
    setSelectedItem(name);
    setSelectedIndex(index); // 선택한 항목의 인덱스 저장
    setData(data); // 선택한 항목의 naver_blog_review_txt 값 저장
  };
  // useEffect(() => {
  //   if (location.state && location.state.resultData) {
  //     setResult(location.state.resultData);
  //     setSelectedItem(location.state.selectedItem || ""); // 선택된 항목의 이름을 state에서 받아옴
  //     setSelectedIndex(location.state.selectedItemIndex || 0); // 선택된 항목의 인덱스를 state에서 받아옴
  //   }
  // }, [location]);
  useEffect(() => {
    if (location.state && location.state.resultData) {
      setResult(location.state.resultData);
    }
    if (location.state && location.state.resultData && result.length > 0) {
      setSelectedItem(location.state.selectedItem || result[0].name);
      setSelectedIndex(location.state.selectedItemIndex || 0);
      setData(location.state.resultData[0]); // 첫 번째 항목의 data 값 저장
    }
  }, [location, result]);
  return (
    <Container fluid>
      <Row>
        <Col md="1"></Col>
        <Col md="2">
          <ListGroup className="menubar" as="ol" numbered>
            {result &&
              result.slice(0, 5).map((item, index) => (
                <ListGroup.Item
                  key={index}
                  as="li"
                  action
                  active={index === selectedIndex}
                  onClick={() => handleItemClick(item.name, index, item)}
                >
                  {item.name}
                </ListGroup.Item>
              ))}
          </ListGroup>
        </Col>
        <Col md="9">
          <Charpage searchText={selectedItem} data={data} flaResult={result} />
        </Col>
      </Row>
    </Container>
  );
};

export default MenuBar;
