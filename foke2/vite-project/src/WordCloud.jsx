import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import ReactWordcloud from "react-wordcloud";

import "tippy.js/dist/tippy.css";
import "tippy.js/animations/scale.css";

const WordCloud = (props) => {
  const [words, setWords] = useState([]);

  useEffect(() => {
    // props 디버깅
    console.log("props:", props);
    if (props) {
      console.log("props.props:", props);
      if (props.data) {
        console.log("props.props.data:", props.data);
        if (props.data.naver_blog_review_txt) {
          console.log(
            "props.props.data.naver_blog_review_txt:",
            props.data.naver_blog_review_txt
          );
          const wordsArray = props.data.naver_blog_review_txt.split(" "); // 단어를 띄어쓰기 마다 나눠서 리스트에 넣는다
          setWords(wordsArray);
        }
      }
    }
  }, [props]);

  const word2 = words.map((d, i) => ({
    text: d,
    value: i + 1, // 인덱스에 1을 더해 값(value) 설정
  }));

  useEffect(() => {
    console.log(">>>>>>>word>>>", words);
  }, [words]);

  return (
    <div style={{ height: 400, width: 700 }}>
      <ReactWordcloud
        words={word2}
        options={{
          fontSizes: [10, 50],
          rotations: 0,
          enableOptimizations: true,
        }}
      />
    </div>
  );
};

export default WordCloud;
