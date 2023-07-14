package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ListDAO.ProductDAO;
import ListDAO.ProductDTO;
import ListDAO.ProductFemaleDAO;
import ListDAO.ProductMaleDAO;
import dao.MVCBoardDAO;
import dto.ReviewStarDTO;

@WebServlet("*.po")
public class Bcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		doPost(request, response);
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		String p_id = request.getParameter("p_id");
		String pageTemp = request.getParameter("pageNum");
		ProductMaleDAO dao = new ProductMaleDAO();
		ProductFemaleDAO dao1 = new ProductFemaleDAO();
		ProductDAO dao2 = new ProductDAO();
		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}

		int totalCount = dao.selectPMaleCount(map);
		/* 페이지 처리 start */

		ServletContext application = getServletContext();
		int pageSize = 4;
		int blockPage = 5;
		int totalPage = (int)Math.ceil((double)totalCount / pageSize);

		// 현재 페이지 확인
		int pageNum = 1;  // 기본값
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

		// 목록에 출력할 게시물 범위 계산
		//int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
		int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
		//int end = pageNum * 4; // 마지막 게시물 번호
		map.put("start", start);
		//map.put("end", end);
		/* 페이지 처리 end */


		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockPage", blockPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("map", map);


		if (command.equals("/Bcontroller.po")) {//��ϵ� �� ��� ������ ����ϱ�
			requestPaging(request);
			request.setAttribute("p_id", p_id);
			request.getRequestDispatcher("/product.jsp?p_id="+p_id).forward(request, response);
		} else if (command.equals("/Male/maleview.po")) {
			List<ProductDTO> plist = dao.selectPMMList(map);
			request.setAttribute("plist", plist);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/Male/topmaleview.po")) {
			List<ProductDTO> plist = dao.selectTOPMList(map);
			request.setAttribute("plist", plist);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/Male/botmaleview.po")) {
			List<ProductDTO> plist = dao.selectBOTMList(map);
			request.setAttribute("plist", plist);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/Male/shoemaleview.po")) {
			List<ProductDTO> plist = dao.selectSHOEMList(map);
			request.setAttribute("plist", plist);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/Female/femaleview.po")) {
			List<ProductDTO> plist = dao1.selectPFemaleList(map);
			request.setAttribute("plist", plist);
			dao1.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/Female/topfemaleview.po")) {
			List<ProductDTO> plist = dao1.selectTOPFList(map);
			request.setAttribute("plist", plist);
			dao1.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/Female/botfemaleview.po")) {
			List<ProductDTO> plist = dao1.selectBOTFList(map);
			request.setAttribute("plist", plist);
			dao1.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/Female/shoefemaleview.po")) {
			List<ProductDTO> plist = dao1.selectSHOEFList(map);
			request.setAttribute("plist", plist);
			dao1.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/allview.po")) {
			List<ProductDTO> plist = dao2.selectList(map);
			String all = "all";
			request.setAttribute("all", all);
			request.setAttribute("plist", plist);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/topallview.po")) {
			List<ProductDTO> plist = dao2.selectTOPList(map);
			String all = "all";
			request.setAttribute("all", all);
			request.setAttribute("plist", plist);
			dao2.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/botallview.po")) {
			List<ProductDTO> plist = dao2.selectBOTList(map);
			String all = "all";
			request.setAttribute("all", all);
			request.setAttribute("plist", plist);
			dao2.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/shoeallview.po")) {
			List<ProductDTO> plist = dao2.selectSHOEList(map);
			String all = "all";
			request.setAttribute("all", all);
			request.setAttribute("plist", plist);
			dao2.close();
			RequestDispatcher rd = request.getRequestDispatcher("/ProductList.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/ViewProduct.po")) {
			requestProductView(request);
			dao.close();
			request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
		} else if(command.equals("/ReviewDetailController.po")) {
			ReviewDetailController(request);
			request.getRequestDispatcher("/ProductReview/productreview.jsp").forward(request, response);
		} else if(command.equals("/ReviewDelete.po")) {
			ReviewDelete(request);
			response.sendRedirect("./Bcontroller.po?p_id="+p_id);	
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dopost()");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		String pageTemp = request.getParameter("pageNum");
		MVCBoardDAO dao = new MVCBoardDAO();
		ProductDAO pDao = new ProductDAO();
		if (command.equals("/ReviewController.po")) {
			String p_id =request.getParameter("p_id");
			response.getWriter().write(getreview(p_id,pageTemp));
			//response.sendRedirect("/WebMarket/product.jsp?p_id="+p_id);
		}else if (command.equals("/AddProduct.po")) {
			System.out.println("/AddProduct.po");
			ProductDTO dto = requestAddProduct(request);
			int rs = dao.insertProduct(dto);
			if(rs==1) {
				response.sendRedirect("/WebMarket/member/resultMember.jsp?msg=4");
			}
			dao.close();
		} else if (command.equals("/EditProduct.po")) {
			ProductDTO dto = requestUpdateProduct(request);
			String pageNum = request.getParameter("pageNum");
			int rs = pDao.updateProduct(dto);
			if(rs==1) response.sendRedirect(pageNum);
		} else if (command.equals("/DeleteProduct.po")) {
			int p_id = Integer.parseInt(request.getParameter("p_id"));
			String pageNum = request.getParameter("pageNum");
			int rs = pDao.deleteProduct(p_id);
			if(rs==1) 
				response.sendRedirect(pageNum);
		} else if (command.equals("/Bcontrollercart.po")) {//占쏙옙溝占  占쏙옙 占쏙옙占  占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙歐占 
	         requestPaging(request);
	         String p_id =request.getParameter("p_id");
	         MVCBoardDAO mdao = new MVCBoardDAO();
	         ProductDTO dto = mdao.pSelectView(p_id);
	         request.setAttribute("p_id", p_id);
	         request.setAttribute("dto", dto);
	         request.getRequestDispatcher("/product.jsp?p_id="+p_id).forward(request, response);
	      }else if (command.equals("/ReviewControllerOne.po")) {
				response.getWriter().write(getreviewOne(request));
			}else if (command.equals("/ReviewUpdate.po")) {
					int index = Integer.parseInt(request.getParameter("index"));
					int update = ReviewUpdate(request);
					if(update == 1) {
						response.getWriter().write("1");
					}else {
						response.getWriter().write("0");
					}
				}
		
		
	}
	
	public void requestPaging(HttpServletRequest request) {
		String p_id = request.getParameter("p_id");
		//System.out.println(p_id);
		Map<String, Object> map = new HashMap<String, Object>();
		MVCBoardDAO mdao = new MVCBoardDAO();
		ProductDTO dto = mdao.pSelectView(p_id);
		
		List<ProductDTO> slide= new ArrayList<>();
		int count = mdao.SelectProductCount_category(dto.getP_category());
		for(int i=0; i<3; i++) {
			int num =(int) (Math.random()*count);
			slide.add(mdao.SelectSlideProduct(dto.getP_category(), num));
		}
		System.out.println(slide);
		
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
		request.setAttribute("slide",slide);
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

	public void requestProductView(HttpServletRequest request){

		int p_id = Integer.parseInt(request.getParameter("p_id"));
		int result = 0;
		ProductDAO dao = new ProductDAO();		

		ProductDTO dto = new ProductDTO();		
		dto = dao.getProduct(p_id);
		request.setAttribute("dto", dto);
		return;

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
	
	public void ReviewDelete(HttpServletRequest request) {
		int index = Integer.parseInt(request.getParameter("index"));
		MVCBoardDAO mdao = new MVCBoardDAO();
		int review = mdao.DeleteReview(index);
		
		
	}
	
	public String getreviewOne(HttpServletRequest request) {
		//System.out.println("실행됐냐2");
		MVCBoardDAO dao = new MVCBoardDAO();
		int index = Integer.parseInt(request.getParameter("index"));
		//출력
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ReviewStarDTO reviewList = dao.SelectStarReViewOne(index);
		dao.close();
		
			result.append("[{\"m_id\":\""+  reviewList.getM_id()+"\"},");
			result.append("{\"star\":\""+  reviewList.getStar()+"\"},");
			result.append("{\"content\":\""+  reviewList.getContent()+"\"},");
			result.append("{\"time\":\""+  reviewList.getPostdate_ymd() +" "+  reviewList.getPostdate_hms()+"\"},");
			result.append("{\"index\":\""+  reviewList.getIndex()+"\"},");
			result.append("{\"title\":\""+  reviewList.getTitle()+"\"},");
			result.append("{\"p_id\":\""+  reviewList.getP_id()+"\"}],");
		
		//System.out.println(reviewList);
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		//System.out.println(result);
		
		return result.toString();
		
	}


public int ReviewUpdate(HttpServletRequest request) {
		int index = Integer.parseInt(request.getParameter("index"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String star = request.getParameter("star");
		MVCBoardDAO mdao = new MVCBoardDAO();
		int result = mdao.UpdateReview(index,content,title,star);
		
		return result;
		
	}
	
}
