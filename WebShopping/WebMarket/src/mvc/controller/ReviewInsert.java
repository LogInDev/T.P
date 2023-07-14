package mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MVCBoardDAO;
import dto.ReviewStarDTO;

@WebServlet("/ReviewInsert.po")
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String m_id = session.getAttribute("sessionId").toString();
		System.out.println(m_id);
		String p_id = request.getParameter("p_id");
		String star = request.getParameter("star");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		System.out.println("dopost()");
//		doGet(request, response);
		int insert = reviewInsert(m_id,p_id,star,content,title);
		if(insert == 1) {
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
		//System.out.println("너 받았냐?");
		
		
	}
	
	private int reviewInsert(String m_id, String p_id, String star, String content,String title) {
		
		MVCBoardDAO mdao = new MVCBoardDAO();
		int review = mdao.ReviewInsert(m_id, p_id, content, star,title);
		mdao.close();
		
		//int review = mdao.ReviewInsert(m_id,p_id, content, content);
		return review;
		
	}

	

}
