package ListDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import mvc.controller.JDBConnect;


public class ProductDAO extends JDBConnect{
	//페이징 처리
	public List<ProductDTO> selectList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();

		String sql = "SELECT * FROM product order by p_id desc limit ?, 8  ";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int) map.get("start"));
			//psmt.setInt(2, (int) map.get("end"));
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
	public List<ProductDTO> selectTOPList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();

		String sql = "SELECT * FROM product where p_category='상의' order by p_id desc limit ?, 8  ";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int) map.get("start"));
			//psmt.setInt(2, (int) map.get("end"));
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
	public List<ProductDTO> selectBOTList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();

		String sql = "SELECT * FROM product where p_category='하의' order by p_id desc limit ?, 8  ";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int) map.get("start"));
			//psmt.setInt(2, (int) map.get("end"));
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
	public List<ProductDTO> selectSHOEList(Map<String, Object>map) {
		List<ProductDTO> board = new ArrayList<ProductDTO>();

		String sql = "SELECT * FROM product where p_category='신발' order by p_id desc limit ?, 8 ";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int) map.get("start"));
			//psmt.setInt(2, (int) map.get("end"));
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

	public ProductDTO getProduct(int p_id) {

		ProductDTO dto = new ProductDTO();

		String sql = "select * from product where p_id = ? order by p_id desc";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, p_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setP_id(rs.getInt("p_id"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_unitPrice(rs.getString("p_unitPrice"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_manufacturer(rs.getString("p_manufacturer"));
				dto.setP_fileName(rs.getString("p_fileName"));
				dto.setP_description(rs.getString("p_description"));
				dto.setP_gender(rs.getString("p_gender"));
			}

			return dto;
		} catch (Exception ex) {
			System.out.println("getProduct() 占쏙옙占쏙옙 : " + ex);
		} 
		return null;
	}

	public int updateProduct(ProductDTO dto) {
		int result=-1;
		try {
			String sql = "update product set p_name=?, p_unitPrice=?, ";
			sql += " p_category=?, p_manufacturer=?, p_fileName=?, p_description=?,";
			sql += " p_gender=? where p_id=?";
			System.out.println(sql);
			psmt = con.prepareStatement(sql);

			psmt.setString(1, dto.getP_name());
			psmt.setString(2, dto.getP_unitPrice());
			psmt.setString(3, dto.getP_category());
			psmt.setString(4, dto.getP_manufacturer());
			psmt.setString(5, dto.getP_fileName());
			psmt.setString(6, dto.getP_description());
			psmt.setString(7, dto.getP_gender());
			psmt.setInt(8, dto.getP_id());

			result = psmt.executeUpdate();			
			con.commit();

		} catch (Exception ex) {
			System.out.println("updateBoard() 占쏙옙占쏙옙 : " + ex);
		} 
		return result;
	} 

	public int deleteProduct(int p_id) {
		int rs=-1;
		String sql = "delete from product where p_id=?";	

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, p_id);
			rs = psmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("deleteBoard() 占쏙옙占쏙옙 : " + ex);
		} 
		return rs;
		
	}	
}