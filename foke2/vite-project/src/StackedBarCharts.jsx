import React from "react";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Legend,
} from "chart.js";
import { Bar } from "react-chartjs-2";

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Legend);

export const options = {
  plugins: {
    title: {
      display: true,
      text: "Month statistics",
    },
  },
  responsive: true,
  scales: {
    x: {
      stacked: true,
    },
    y: {
      stacked: true,
    },
  },
};

const labels = ["January", "Febrauary", "March"];
export const data = {
  labels,
  datasets: [
    {
      label: "Bank Account 1",
      data: [300, 300, -400],
      backgroundColor: "rgb(255, 99, 132)",
    },
    {
      label: "Bank Account 2",
      data: [500, -300, 800],
      backgroundColor: "rgb(75, 192, 192)",
    },
    {
      label: "Bank Account 3",
      data: [500, 300, -400],
      backgroundColor: "rgb(53, 162, 235)",
    },
  ],
};

const StackedBarCharts = () => {
  return (
    <div>
      <Bar options={options} data={data} />
    </div>
  );
};

export default StackedBarCharts;
