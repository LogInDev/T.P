package ListDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import mvc.controller.JDBConnect;


public class ProductFemaleDAO extends JDBConnect{
	
	
	//여자옷 보러가기
	public List<ProductDTO> selectPFemaleList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();
		
		String sql = "SELECT * FROM product where p_gender ='female' order by p_id desc limit ?, 4 ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int) map.get("start"));
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setP_id(rs.getInt("p_id"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_unitPrice(rs.getString("p_unitPrice"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_manufacturer(rs.getString("p_manufacturer"));
				dto.setP_fileName(rs.getString("p_fileName"));				
				dto.setP_description(rs.getString("p_description"));				
				dto.setP_gender(rs.getString("p_gender"));				
				board.add(dto);			
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;		
	}
	
	//여자상의 불러오기
		public List<ProductDTO> selectTOPFList(Map<String, Object>map) {
			List<ProductDTO> board = new ArrayList<ProductDTO>();
			
			String sql = "SELECT * FROM product where p_gender ='female' and p_category='상의' order by p_id desc limit ?, 4 ";
			System.out.println(sql);
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, (int) map.get("start"));
				//psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setP_id(rs.getInt("p_id"));
					dto.setP_name(rs.getString("p_name"));
					dto.setP_unitPrice(rs.getString("p_unitPrice"));
					dto.setP_category(rs.getString("p_category"));
					dto.setP_manufacturer(rs.getString("p_manufacturer"));
					dto.setP_fileName(rs.getString("p_fileName"));				
					dto.setP_description(rs.getString("p_description"));				
					dto.setP_gender(rs.getString("p_gender"));				
					board.add(dto);			
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return board;		
		}
		//여자하의 불러오기
		public List<ProductDTO> selectBOTFList(Map<String, Object>map) {
			List<ProductDTO> board = new ArrayList<ProductDTO>();
			
			String sql = "SELECT * FROM product where p_gender ='female' and p_category='하의' order by p_id desc limit ?, 4 ";
			System.out.println(sql);
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, (int) map.get("start"));
				//psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setP_id(rs.getInt("p_id"));
					dto.setP_name(rs.getString("p_name"));
					dto.setP_unitPrice(rs.getString("p_unitPrice"));
					dto.setP_category(rs.getString("p_category"));
					dto.setP_manufacturer(rs.getString("p_manufacturer"));
					dto.setP_fileName(rs.getString("p_fileName"));				
					dto.setP_description(rs.getString("p_description"));				
					dto.setP_gender(rs.getString("p_gender"));				
					board.add(dto);			
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return board;		
		}
		//여자신발 불러오기
		public List<ProductDTO> selectSHOEFList(Map<String, Object>map) {
			List<ProductDTO> board = new ArrayList<ProductDTO>();
			
			String sql = "SELECT * FROM product where p_gender ='female' and p_category='신발' order by p_id desc limit ?, 4 ";
			System.out.println(sql);
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, (int) map.get("start"));
				//psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setP_id(rs.getInt("p_id"));
					dto.setP_name(rs.getString("p_name"));
					dto.setP_unitPrice(rs.getString("p_unitPrice"));
					dto.setP_category(rs.getString("p_category"));
					dto.setP_manufacturer(rs.getString("p_manufacturer"));
					dto.setP_fileName(rs.getString("p_fileName"));				
					dto.setP_description(rs.getString("p_description"));				
					dto.setP_gender(rs.getString("p_gender"));				
					board.add(dto);			
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return board;		
		}
	
	public int selectPFemaleCount(Map<String, Object> map) {
		int totalCount = 0; // 결과(게시물 수)를 담을 변수

		// 게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM product where p_gender = 'female' order by p_id desc";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();   // 쿼리문 생성
			rs = stmt.executeQuery(query);  // 쿼리 실행
			rs.next();  // 커서를 첫 번째 행으로 이동
			totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount; 
	}
	
	//페이징 처리
		public List<ProductDTO> selectPFemalePList(Map<String, Object>map) {
			List<ProductDTO> board = new ArrayList<ProductDTO>();
			
			String sql = "SELECT * FROM product where p_gender ='female' order by p_id desc limit ?, 4 ";
			System.out.println(sql);
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, (int) map.get("start"));
				//psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setP_id(rs.getInt("p_id"));
					dto.setP_name(rs.getString("p_name"));
					dto.setP_unitPrice(rs.getString("p_unitPrice"));
					dto.setP_category(rs.getString("p_category"));
					dto.setP_manufacturer(rs.getString("p_manufacturer"));
					dto.setP_fileName(rs.getString("p_fileName"));				
					dto.setP_description(rs.getString("p_description"));				
					dto.setP_gender(rs.getString("p_gender"));				
					board.add(dto);			
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return board;		
		}
	
	public List<ProductDTO> getSearch(Map<String, String> map) {
		List<ProductDTO> list = new ArrayList<>();
		System.out.println(map);
		String sql = "select * from product where p_name like '%"+map.get("search2")+ "%' order by p_id desc";
		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setP_id(rs.getInt("p_id"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_unitPrice(rs.getString("p_unitPrice"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_manufacturer(rs.getString("p_manufacturer"));
				dto.setP_fileName(rs.getString("p_fileName"));				
				dto.setP_description(rs.getString("p_description"));				
				dto.setP_gender(rs.getString("p_gender"));
				list.add(dto);
				System.out.println(list);
			}
		}catch (Exception e) {
			System.out.println("데이터베이스 연결이 실패되었습니다.<br>");
			System.out.println("Exception: " + e.getMessage());
		}
		return list;
	}

}
