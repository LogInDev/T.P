package ListDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import mvc.controller.JDBConnect;


public class ProductMaleDAO extends JDBConnect{
	
	public int selectPMaleCount(Map<String, Object> map) {
		int totalCount = 0; // 寃곌낵(寃뚯떆臾� �닔)瑜� �떞�쓣 蹂��닔

		// 寃뚯떆臾� �닔瑜� �뼸�뼱�삤�뒗 荑쇰━臾� �옉�꽦
		String query = "SELECT COUNT(*) FROM product order by p_id desc";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();   // 荑쇰━臾� �깮�꽦
			rs = stmt.executeQuery(query);  // 荑쇰━ �떎�뻾
			rs.next();  // 而ㅼ꽌瑜� 泥� 踰덉㎏ �뻾�쑝濡� �씠�룞
			totalCount = rs.getInt(1);  // 泥� 踰덉㎏ 移쇰읆 媛믪쓣 媛��졇�샂
		}
		catch (Exception e) {
			System.out.println("寃뚯떆臾� �닔瑜� 援ы븯�뒗 以� �삁�쇅 諛쒖깮");
			e.printStackTrace();
		}

		return totalCount; 
	}
	
	//�궓�옄�샆 蹂대윭媛�湲�
	public int selectPMList(Map<String, Object>map) {
		int totalCount = 0;

		String sql = "SELECT * FROM product";
		sql += " where p_gender = 'male' order by p_id desc";
		System.out.println(sql);

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);	

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalCount;		
	}
	
	//�궓�옄�긽�쓽 遺덈윭�삤湲�
	public List<ProductDTO> selectTOPMList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();
		
		String sql = "SELECT * FROM product where p_gender ='male' and p_category='상의' order by p_id desc limit ?, 4 ";
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
	//�궓�옄 �븯�쓽 遺덈윭�삤湲�
	public List<ProductDTO> selectBOTMList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();
		
		String sql = "SELECT * FROM product where p_gender ='male' and p_category='하의' order by p_id desc limit ?, 4 ";
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
		//�궓�옄 �떊諛� 遺덈윭�삤湲�
		public List<ProductDTO> selectSHOEMList(Map<String, Object>map) {
			List<ProductDTO> board = new ArrayList<ProductDTO>();
			
			String sql = "SELECT * FROM product where p_gender ='male' and p_category='신발' order by p_id desc limit ?, 4 ";
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
	
	//�럹�씠吏� 泥섎━
	public List<ProductDTO> selectPMMList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();
		
		String sql = "SELECT * FROM product where p_gender ='male' order by p_id desc limit ?, 4 ";
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
			System.out.println("�뜲�씠�꽣踰좎씠�뒪 �뿰寃곗씠 �떎�뙣�릺�뿀�뒿�땲�떎.<br>");
			System.out.println("Exception: " + e.getMessage());
		}
		return list;
	}

}
