import "./App.css";
import MenuBar from "./MenuBar";
import Index from "./Index";

import { Route, Routes } from "react-router-dom";
import { useEffect, useState } from "react";

function App() {
  const [result, setResult] = useState(null);

  const handleResultChange = (newResult) => {
    setResult(newResult);
  };

  return (
    <div>
      <Index setResult={handleResultChange} />
      <Routes>
        <Route path="/name1/:result" element={<MenuBar result={result} />} />
      </Routes>
    </div>
  );
}

export default App;
