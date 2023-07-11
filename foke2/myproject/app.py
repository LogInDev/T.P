from flask import Flask,jsonify,request
from flask_cors import CORS
import re
import json
import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer # 피체 벡터화
from sklearn.metrics.pairwise import cosine_similarity


app = Flask(__name__)
CORS(app) # 필요한 경우 CORS 설정을 적용합니다.

@app.route('/process-text', methods=['POST'])
def process_text():
    input_text = request.json.get("text", "")
    dfX = pd.read_csv('./네이버맛집Scaler.csv')

    count_vect_category = CountVectorizer(min_df=1, ngram_range=(1, 2))
    place_category = count_vect_category.fit_transform(dfX['cate_mix'])
    place_simi_cate = cosine_similarity(place_category, place_category)
    place_simi_cate_sorted_ind = place_simi_cate.argsort()[:, ::-1]

    count_vect_review = CountVectorizer(min_df=1, ngram_range=(1, 2))
    place_review = count_vect_review.fit_transform(dfX['cate_2'])
    place_simi_review = cosine_similarity(place_review, place_review)
    place_simi_review_sorted_ind = place_simi_review.argsort()[:, ::-1]

    place_simi_co = (
                 + place_simi_cate * 0.3 # 공식 1. 카테고리 유사도
                 + place_simi_review * 1 # 공식 2. 리뷰 텍스트 유사도
                 + np.tile(dfX['naver_blog_review_qty'].values.reshape(-1, 1), len(dfX)) * 0.001  # 공식 3. 블로그 리뷰가 얼마나 많이 올라왔는지
                 + np.tile(dfX['naver_star_point'].values.reshape(-1, 1), len(dfX)) * 0.005      # 공식 4. 블로그 별점이 얼마나 높은지
                 + np.tile(dfX['naver_star_point_qty'].values.reshape(-1, 1), len(dfX)) * 0.001  # 공식 5. 블로그 별점 평가가 얼마나 많이 됐는지
                 )

    place_simi_co_sorted_ind = place_simi_co.argsort()[:, ::-1] 

    # def normalize_similarity(similarity_values):
    #     min_value = np.min(similarity_values)
    #     max_value = np.max(similarity_values)
    #     return (similarity_values - min_value) / (max_value - min_value)
    min_value = np.min(place_simi_co)
    max_value = np.max(place_simi_co)
    normalized_similarity = (place_simi_co - min_value) / (max_value - min_value)

    # normalized_similarity = normalize_similarity(place_simi_co)

    def find_simi_place(dfX, sorted_ind, similarity, place_name):
        place_title = dfX[dfX['name'].str.contains(place_name)]
        place_index = place_title.index.values[0]
        # 첫 번째 인덱스 값을 가져옵니다
        similar_indexes = sorted_ind[place_index, : ]
        # Calculate the similarity ratio(유사도 비율 계산)
        similarity_ratios = similarity[place_index, similar_indexes]
        result = dfX.iloc[similar_indexes].copy()
        result['similarity_ratio'] = similarity_ratios # 유사도 비율이 높은 순서대로 결과 정렬
        result = result.sort_values(by='similarity_ratio', ascending=False)
        # 블로그 리뷰 글자수가 많은 순서대로 결과 정렬
        # result['review_txt_length'] = result['naver_blog_review_txt'].str.len()
        # result = result.sort_values(by='review_txt_length', ascending=False)
        return result

    Ans = find_simi_place(
        dfX,
        place_simi_co_sorted_ind,
        normalized_similarity,
        input_text
    )
    
    def remove_non_korean(text):
        return re.sub('[^가-힣]+', ' ', text).strip()

    data_dict = Ans.to_dict('records')
    for item in data_dict:
        for key, value in item.items():
            if isinstance(value, str):
                item[key] = remove_non_korean(value)
    
    return jsonify(data_dict)

    # 머신러닝 작업 수행 (예: 결과 = 머신러닝 함수(input_text))
    # machine_learning_result = '여기에 머신러닝 결과 작성: ' + input_text

    # return jsonify({'result': machine_learning_result})

if __name__ == '__main__':
    app.run(debug=True, port=5000)
