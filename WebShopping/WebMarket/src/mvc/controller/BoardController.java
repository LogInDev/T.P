package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MVCBoardDAO;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.MemberDAO;
import mvc.model.MemberDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		doPost(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		if (command.equals("/DeleteMember.do")) {
			MemberDAO dao = new MemberDAO();
			int rs = dao.deletePost(id);
			session.invalidate();
			if(rs==1) {
				response.sendRedirect("/WebMarket/member/resultMember.jsp");
			}else {
				response.sendRedirect("/WebMarket/welcome.jsp");
			}
			dao.close();
		}else if(command.equals("/adminWrite.do")) {
			int userNum = Integer.parseInt(request.getParameter("userNum"));
			BoardDAO dao = BoardDAO.getInstance();
			BoardDTO dto = dao.getBoardByNum(userNum, 1);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("/board/adminWriteForm.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		String uid = request.getParameter("id");
		String upass = request.getParameter("password");
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		if (command.equals("/BoardListAction.do")) {//占쏙옙溝占� 占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙歐占�
			requestBoardList(request);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/board/list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) { // 占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙歐占�
			requestLoginName(request);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);				
		} else if (command.equals("/BoardWriteAction.do")) {// 占쏙옙占싸울옙 占쏙옙 占쏙옙占쏙옙歐占�
			requestBoardWrite(request);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);						
		} else if (command.equals("/BoardViewAction.do")) {//占쏙옙占시듸옙 占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
			requestBoardView(request);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);						
		} else if (command.equals("/BoardView.do")) { //占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙歐占�
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);	
		} else if (command.equals("/BoardUpdateAction.do")) { //占쏙옙占시듸옙 占쏙옙占쏙옙 占쏙옙회占쏙옙 占쏙옙占쏙옙占싹깍옙
			requestBoardUpdate(request, response);
			dao.close();
			response.sendRedirect("/WebMarket/BoardViewAction.do?num="+request.getParameter("num")+"&pageNum="+request.getParameter("pageNum"));
			//RequestDispatcher rd = request.getRequestDispatcher("/WebMarket/BoardViewAction.do?num="+request.getParameter("num")+"&pageNum="+request.getParameter("pageNum"));
			//rd.forward(request, response);
		}else if (command.equals("/BoardDeleteAction.do")) { //占쏙옙占시듸옙 占쏙옙 占쏙옙占쏙옙占싹깍옙
			requestBoardDelete(request);
			dao.close();
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);				
		}else if (command.equals("/loginMember.do")) { //濡쒓렇�씤 泥섎━
			String id = dao.getMemberId(uid, upass);
			String pageNum = request.getParameter("pageNum");
			System.out.println(pageNum.getClass());
			if(id != null ) {
				session.setAttribute("sessionId", id);
				if(!pageNum.equals("null")) {
					
					response.sendRedirect(pageNum);
					}
				else {response.sendRedirect("/WebMarket/member/resultMember.jsp?msg=2");}
			} else {
				response.sendRedirect("/WebMarket/member/loginMember.jsp?error=1");
			}
			dao.close();
		}else if (command.equals("/UpdateMember.do")) {
	         MemberDTO dto = requestUpdateMember(request);
	         Date currentDatetime = new Date(System.currentTimeMillis());
	         java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	         java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
	         dto.setRegist_day(timestamp);
	         int rs = dao.updateEdit(dto);
	         dao.close();
	         if(rs==1) {
	            response.sendRedirect("/WebMarket/member/resultMember.jsp?msg=0");
	         }   
		}else if(command.equals("/AddMember.do")) {
			MemberDTO dto = requestAddMember(request);
			int rs = dao.insertWrite(dto);
			if(rs==1) {
				response.sendRedirect("/WebMarket/member/resultMember.jsp?msg=1");
			}
			dao.close();
		}else if(command.equals("/adminInsert.do")) {
			requestAdminBoardWrite(request);
			dao.close();
			response.sendRedirect("/WebMarket/BoardListAction.do?pageNum=1");
		}else if(command.equals("/replyCheck.do")) {
			String userNum = (String)request.getAttribute("userNumm");
			dao.close();
			request.getRequestDispatcher("/board/list.jsp").forward(request, response);
		}else if(command.equals("/replyView.do")) {
			requestAdminBoardView(request);
			request.getRequestDispatcher("/board/adminView.jsp").forward(request, response);
		}else if(command.equals("/adminUpdateAction.do")) {
			requestBoardUpdate(request, response);
			dao.close();
			response.sendRedirect("/WebMarket/BoardListAction.do?pageNum=" + request.getParameter("pageNum"));
	}

	}
	//占쏙옙溝占� 占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙	
	public void requestBoardList(HttpServletRequest request){

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		List<BoardDTO> adminlist = dao.getAdminBoardList();
		
		int pageNum=1;
		int limit=LISTCOUNT;

		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));

		String items = request.getParameter("items");//寃��깋 醫낅쪟
		String text = request.getParameter("text"); //寃��깋媛�
		int total_record=dao.getListCount(items, text);//珥� 寃뚯떆臾� �닔
		boardlist = dao.getBoardList(pageNum,limit, items, text); // 珥� 寃뚯떆臾�(List)
		//int total_page;

		//		if (total_record % limit == 0){     
		//	     	total_page =total_record/limit;
		//	     	Math.floor(total_page);  
		//		}
		//		else{
		//		   total_page =total_record/limit;
		//		   Math.floor(total_page); 
		//		   total_page =  total_page + 1; 
		//		}		z
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("adminlist", adminlist);
		//request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);	
		return;
	}
	//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙美占� 占쏙옙占쏙옙占쏙옙占쏙옙
	public void requestLoginName(HttpServletRequest request){

		String id = request.getParameter("id");

		BoardDAO  dao = BoardDAO.getInstance();

		String name = dao.getLoginNameById(id);		

		request.setAttribute("name", name);		
		return;
	}
	// 占쏙옙占싸울옙 占쏙옙 占쏙옙占쏙옙歐占�
	public void requestBoardWrite(HttpServletRequest request){

		BoardDAO dao = BoardDAO.getInstance();		

		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));	

		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 

		board.setHit("0");
		board.setRegist_day(regist_day);

		dao.insertBoard(board);	
		return;
	}
	//占쏙옙占시듸옙 占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public void requestBoardView(HttpServletRequest request){

		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	

		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);		

		request.setAttribute("num", num);		 
		request.setAttribute("page", pageNum); 
		request.setAttribute("board", board);   	
		return;
	}
	public void requestAdminBoardView(HttpServletRequest request){
		
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("adminNum"));
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num,0);
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		request.setAttribute("page", pageNum); 

		request.setAttribute("adminNum", num);		 
		request.setAttribute("board", board);   	
		return;
	}
	//占쏙옙占시듸옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙
	public void requestBoardUpdate(HttpServletRequest request, HttpServletResponse response){

		String num = request.getParameter("num");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		int result = 0;
		BoardDAO dao = BoardDAO.getInstance();		
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = mDao.selectView(id);
		BoardDTO board = new BoardDTO();		
		board.setNum(num);
		board.setId(request.getParameter("id"));
		board.setName(name);
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));		

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 

		board.setHit("0");
		board.setRegist_day(regist_day);
		result = dao.updateBoard(board);
		return;

	}

	//占쏙옙占시듸옙 占쏙옙 占쏙옙占쏙옙占싹깍옙
	public void requestBoardDelete(HttpServletRequest request){

		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	

		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);	
		return;
	}	

	public MemberDTO requestUpdateMember(HttpServletRequest request) {
		MemberDTO dto = new MemberDTO();

		//birth
		String year = request.getParameter("birthyy");
		String month = request.getParameterValues("birthmm")[0];
		String day = request.getParameter("birthdd");
		String birth = year + "/" + month + "/" + day;

		//mail
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameterValues("mail2")[0];
		String mail = mail1 + "@" + mail2;

		dto.setAddress(request.getParameter("address"));
		dto.setBirth(birth);
		dto.setId(request.getParameter("id"));
		dto.setGender(request.getParameter("gender"));
		dto.setMail(mail);
		dto.setName(request.getParameter("name"));
		dto.setPassword(request.getParameter("password"));
		dto.setPhone(request.getParameter("phone"));
		return dto;
	}

	public MemberDTO requestAddMember(HttpServletRequest request)  {
		MemberDTO dto = new MemberDTO();
		String year = request.getParameter("birthyy");
		String month = request.getParameterValues("birthmm")[0];
		String day = request.getParameter("birthdd");
		String birth = year + "/" + month + "/" + day;
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameterValues("mail2")[0];
		String mail = mail1 + "@" + mail2;

		Date currentDatetime = new Date(System.currentTimeMillis());
		java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
		java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());

		dto.setAddress(request.getParameter("address"));
		dto.setBirth(birth);
		dto.setGender(request.getParameter("gender"));
		dto.setId(request.getParameter("id"));
		dto.setMail(mail);
		dto.setName(request.getParameter("name"));
		dto.setPassword(request.getParameter("password"));
		dto.setPhone(request.getParameter("phone"));
		dto.setRegist_day(timestamp);
		return dto;
	}

	//�븣由쇱갹 �쓣�슦湲�
	public static void alert(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write(("<script>alert('"+msg+"');</script>"));
			w.flush();
			w.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return;
	}

	public void requestAdminBoardWrite(HttpServletRequest request){

		BoardDAO dao = BoardDAO.getInstance();		
		String id = request.getParameter("id");
		BoardDTO board = new BoardDTO();
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = mDao.selectView(id);
		board.setId(id);
		board.setName(mDto.getName());
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));	
		board.setUserNum(request.getParameter("userNum"));	

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 

		board.setHit("0");
		board.setRegist_day(regist_day);

		dao.insertBoard(board);	
	
		return;
	}
		

}
