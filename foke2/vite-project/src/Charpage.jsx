import React, { useEffect, useState } from "react";
import { BarChart } from "./BarChart";
import DoughnutChart from "./DoughnutChart";
import WordCloud from "./WordCloud";
import Container from "react-bootstrap/esm/Container";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";

const Charpage = (props) => {
  const [store, setstore] = useState("");
  const [data, setData] = useState([]);
  console.log("Selected Name:", props);
  console.log("Review Text:", props.reviewText);
  //=========================================================
  //엘라스틱 서치 연동
  const getJson = () => {
    const match = {
      size: 1,
      query: {
        query_string: {
          fields: ["name"],
          query: store,
        },
      },
    };
    const url = "/elasticsearch";
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(match),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(".>>>>>>>>", data);
        setData(data.hits.hits[0]._source); // 결과 중 _source 부분만 data 상태에 저장
      })
      .catch((error) => {
        console.log(error);
      });
  };

  useEffect(() => {
    if (props.searchText) {
      setstore(props.searchText);
    }
  }, [props.searchText]);

  useEffect(() => {
    if (store) {
      getJson(); // store 상태가 업데이트될 때마다 호출한다
    }
  }, [store]);

  return (
    <div>
      <BarChart
        store={props.searchText}
        data={props.data}
        flaResult={props.flaResult}
      />
      {/* // data를 BarChart에 prop으로 전달 */}
      <Container>
        <Row>
          {/* <Col md="4">
            <div className="ChartCss">
              <DoughnutChart store={store} data={data} />
            </div>
          </Col>
          <Col md="2"></Col> */}
          <Col md="2"></Col>
          <Col md="4">
            <div className="wordCss">
              <WordCloud store={data.name} data={data} />
            </div>
          </Col>
          <Col md="2"></Col>
        </Row>
      </Container>
    </div>
  );
};

export default Charpage;
