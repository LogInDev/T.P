package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import ListDAO.ProductDAO;
import ListDAO.ProductDTO;
import dto.ReviewStarDTO;

public class ViewDAO {
	
	public void requestPaging(HttpServletRequest request) {
		String p_id = request.getParameter("p_id");
		//System.out.println(p_id);
		Map<String, Object> map = new HashMap<String, Object>();
		MVCBoardDAO mdao = new MVCBoardDAO();
		ProductDTO dto = mdao.pSelectView(p_id);
		
		
		int totalCount = Integer.parseInt(mdao.SelectCountReview(p_id));
		int pageSize =5;
		int blockPage = 5;
		int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수
		int pageNum = 1; // 바꿔가면서 테스트 1~10 =>1, 11~20 => 11
		String pageTemp = request.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
		int end = pageNum * pageSize; // 마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);

		mdao.close();
		
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockPage", blockPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		return;
	}
	
	public String getreview(String p_id,String pageTemp) {
		//System.out.println("실행됐냐2");
		MVCBoardDAO dao = new MVCBoardDAO();
		Map<String, Object> map = new HashMap<String, Object>();
		//페이징
		int totalCount = Integer.parseInt(dao.SelectCountReview(p_id));
		int pageSize =5;
		int blockPage = 5;
		int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수
		int pageNum = 1; // 바꿔가면서 테스트 1~10 =>1, 11~20 => 11
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
		int end = pageNum * pageSize; // 마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		
		//출력
		if(p_id == null) p_id="";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		List<ReviewStarDTO> reviewList = dao.SelectStarReView(p_id,map);
		dao.close();
		for(int i = 0; i<reviewList.size(); i++) {
			result.append("[{\"m_id\":\""+  reviewList.get(i).getM_id()+"\"},");
			result.append("{\"star\":\""+  reviewList.get(i).getStar()+"\"},");
			result.append("{\"content\":\""+  reviewList.get(i).getContent()+"\"},");
			result.append("{\"time\":\""+  reviewList.get(i).getPostdate_ymd() +" "+  reviewList.get(i).getPostdate_hms()+"\"},");
			result.append("{\"index\":\""+  reviewList.get(i).getIndex()+"\"},");
			result.append("{\"title\":\""+  reviewList.get(i).getTitle()+"\"},");
			result.append("{\"p_id\":\""+  reviewList.get(i).getP_id()+"\"}],");
		}
		//System.out.println(reviewList);
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		//System.out.println(result);
		
		return result.toString();
		
	}
	
	public ProductDTO requestAddProduct(HttpServletRequest request)  {
		ProductDTO dto = new ProductDTO();
		dto.setP_name(request.getParameter("p_name"));
		dto.setP_unitPrice(request.getParameter("p_unitPrice"));
		dto.setP_description(request.getParameter("p_description"));
		dto.setP_manufacturer(request.getParameter("p_manufacturer"));
		dto.setP_category(request.getParameter("p_category"));
		dto.setP_gender(request.getParameter("p_gender"));
		dto.setP_fileName(request.getParameter("p_fileName"));
		return dto;
	} 

	public ProductDTO requestProductView(HttpServletRequest request){

		int p_id = Integer.parseInt(request.getParameter("p_id"));
		int result = 0;
		ProductDAO dao = new ProductDAO();		

		ProductDTO dto = new ProductDTO();		
		dto = dao.getProduct(p_id);
		request.setAttribute("dto", dto);
		return dto;

	}

	public ProductDTO requestUpdateProduct(HttpServletRequest request) {
		ProductDTO dto = new ProductDTO();

		dto.setP_id(Integer.parseInt(request.getParameter("p_id")));
		dto.setP_name(request.getParameter("p_name"));
		dto.setP_description(request.getParameter("p_description"));
		dto.setP_manufacturer(request.getParameter("p_manufacturer"));
		dto.setP_fileName(request.getParameter("p_fileName"));
		dto.setP_category(request.getParameter("p_category"));
		dto.setP_gender(request.getParameter("p_gender"));
		dto.setP_unitPrice(request.getParameter("p_unitPrice"));
		
		
		return dto;
	}
	
	public void ReviewDetailController(HttpServletRequest request) {
		int index = Integer.parseInt(request.getParameter("index"));
		MVCBoardDAO mdao = new MVCBoardDAO();
		ReviewStarDTO review  = mdao.SelectReviewOne(index);
		
		request.setAttribute("review", review);

	}

}
