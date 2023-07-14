package mvc.model;

import java.util.ArrayList;

import mvc.controller.JDBConnect;

public class BoardDAO extends JDBConnect {

	private static BoardDAO instance;

	private BoardDAO() {
		super();
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}	
	//board 占쏙옙占싱븝옙占쏙옙 占쏙옙占쌘듸옙 占쏙옙占쏙옙
	public int getListCount(String items, String text) {

		int x = 0;

		String sql;

		if (items == null && text == null)
			sql = "select count(*) from board where id <> 'admin'";
		else
			sql = "SELECT  count(*) FROM board where " + items + " like '%" + text + "%' and id <> 'admin'";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);

		} catch (Exception ex) {
			System.out.println("getListCount() 占쏙옙占쏙옙: " + ex);
		} 
		return x;
	}
	//board 占쏙옙占싱븝옙占쏙옙 占쏙옙占쌘듸옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {

		int total_record = getListCount(items, text );
		int start = (page - 1) * limit;
		int index = start + 1;
		String sql;

		if (items == null && text == null)
			sql = "select * from board where id <> 'admin' ORDER BY num DESC";
		else
			sql = "SELECT  * FROM board where " + items + " like '%" + text + "%' "
					+ " and id <> 'admin' ORDER BY num DESC ";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getString("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getString("hit"));
				board.setUserNum(rs.getString("userNum"));
				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList() 占쏙옙占쏙옙 : " + ex);
		} 
		return null;
	}
	public ArrayList<BoardDTO> getAdminBoardList() {

		String sql;
		ArrayList<BoardDTO> list =null;
			sql = "select * from board where id = 'admin' ORDER BY num DESC";
			list = new ArrayList<BoardDTO>();

			try {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();

				while (rs.next()) {
					BoardDTO board = new BoardDTO();
					board.setNum(rs.getString("num"));
					board.setId(rs.getString("id"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegist_day(rs.getString("regist_day"));
					board.setHit(rs.getString("hit"));
					board.setUserNum(rs.getString("userNum"));
					list.add(board);
				}
			} catch (Exception ex) {
				System.out.println("getBoardList() 占쏙옙占쏙옙 : " + ex);
			} 
		return list;
	}
	//member 占쏙옙占싱븝옙占쏙옙 占쏙옙占쏙옙占쏙옙 id占쏙옙 占쏙옙占쏙옙美占� 占쏙옙占쏙옙占쏙옙占쏙옙
	public String getLoginNameById(String id) {

		String name=null;
		String sql = "select * from member where id = ? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) 
				name = rs.getString("name");	

			return name;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 占쏙옙占쏙옙 : " + ex);
		} 
		return null;
	}

	//board 占쏙옙占싱븝옙 占쏙옙占싸울옙 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public void insertBoard(BoardDTO board)  {
		try {

			String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, board.getNum());
			psmt.setString(2, board.getId());
			psmt.setString(3, board.getName());
			psmt.setString(4, board.getSubject());
			psmt.setString(5, board.getContent());
			psmt.setString(6, board.getRegist_day());
			psmt.setString(7, board.getHit());
			psmt.setString(8, board.getUserNum());

			psmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 占쏙옙占쏙옙 : " + ex);
		} 	
	} 
	//占쏙옙占시듸옙 占쏙옙占쏙옙 占쏙옙회占쏙옙 占쏙옙占쏙옙占싹깍옙
	public void updateHit(int num) {

		try {

			String sql = "select hit from board where num = ? ";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			int hit = 0;

			if (rs.next())
				hit = rs.getInt("hit") + 1;


			sql = "update board set hit=? where num=?";
			psmt = con.prepareStatement(sql);		
			psmt.setInt(1, hit);
			psmt.setInt(2, num);
			psmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateHit() 占쏙옙占쏙옙 : " + ex);
		} 
	}
	//占쏙옙占시듸옙 占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public BoardDTO getBoardByNum(int num, int page) {

		BoardDTO board = null;

		updateHit(num);
		String sql = "select * from board where num = ? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getString("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getString("hit"));
				board.setUserNum(rs.getString("userNum"));
			}

			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 占쏙옙占쏙옙 : " + ex);
		} 
		return null;
	}
	public BoardDTO getBoardByNum(String id) {

		BoardDTO board = new BoardDTO();

		String sql = "select * from board where id = ? ";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				board.setNum(rs.getString("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getString("hit"));
				board.setUserNum(rs.getString("userNum"));
			}

			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 占쏙옙占쏙옙 : " + ex);
		} 
		return null;
	}
	//占쏙옙占시듸옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙
	public int updateBoard(BoardDTO board) {
		int result=-1;
		try {
			String sql = "update board set name=?, subject=?, content=? where num=?";
			System.out.println(sql);
			psmt = con.prepareStatement(sql);

			con.setAutoCommit(false);

			psmt.setString(1, board.getName());
			psmt.setString(2, board.getSubject());
			psmt.setString(3, board.getContent());
			psmt.setString(4, board.getNum());

			result = psmt.executeUpdate();			
			con.commit();

		} catch (Exception ex) {
			System.out.println("updateBoard() 占쏙옙占쏙옙 : " + ex);
		} 
		return result;
	} 
	//占쏙옙占시듸옙 占쏙옙 占쏙옙占쏙옙占싹깍옙
	public void deleteBoard(int num) {

		String sql = "delete from board where num=?";	

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteBoard() 占쏙옙占쏙옙 : " + ex);
		} 
	}	
}
