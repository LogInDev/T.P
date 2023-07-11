import React from "react";
import { Bar, Line } from "react-chartjs-2";
import { Chart as ChartJS } from "chart.js/auto";
import Container from "react-bootstrap/esm/Container";
import Row from "react-bootstrap/esm/Row";
import Col from "react-bootstrap/esm/Col";
import {
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Legend,
} from "chart.js";
import YoutubeIframe from "./YoutubeIframe";

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Legend);

// export const options_stack = {
//   plugins: {
//     title: {
//       display: true,
//       text: "Month statistics",
//     },
//   },
//   responsive: true,
//   scales: {
//     x: {
//       stacked: true,
//     },
//     y: {
//       stacked: true,
//     },
//   },
// };
// const labels_stack = ["January", "Febrauary", "March"];

// export const data_stack = {
//   labels: labels_stack,
//   datasets: [
//     {
//       label: "Bank Account 1",
//       data: [300, 300, -400],
//       backgroundColor: "rgb(255, 99, 132)",
//     },
//     {
//       label: "Bank Account 2",
//       data: [500, -300, 800],
//       backgroundColor: "rgb(75, 192, 192)",
//     },
//     {
//       label: "Bank Account 3",
//       data: [500, 300, -400],
//       backgroundColor: "rgb(53, 162, 235)",
//     },
//   ],
// };

export const BarChart = (props) => {
  console.log("++++++++++++++++++", props);
  const data1 = {
    labels: [
      "네이버 별점",
      "네이버 별점 리뷰 수",
      "블로그 글자 수",
      "유사도",
      "네이버 블로그 수",
    ],
    datasets: [
      {
        label: "Dataset",
        data: [
          props.data.naver_star_point,
          props.data.naver_star_point_qty * 7,
          props.data.review_txt_length,
          props.data.similarity_ratio,
          props.data.naver_blog_review_qty * 7,
        ],
        borderColor: "red",
        backgroundColor: "rgba(255, 0, 0, 0.5)",
        pointStyle: "circle",
        pointRadius: 10,
        pointHoverRadius: 15,
      },
    ],
  };
  const options1 = {
    responsive: true,
    plugins: {
      title: {
        display: true,
        text: (ctx) => "Point Style: " + ctx.chart.data.datasets[0].pointStyle,
      },
    },
  };

  return (
    <div className="App">
      <Container>
        <Row>
          <Col md="4">
            <div className="ChartCss">
              <Line data={data1} options={options1} />
            </div>
          </Col>
          <Col md="2"></Col>
          <Col md="4">
            <div className="ChartCss">
              {/* <Bar data={data} /> */}
              <YoutubeIframe store={props.data.name} />
              {/* <Bar options={options_stack} data={data_stack} /> */}
            </div>
          </Col>
        </Row>
      </Container>
    </div>
  );
};
