package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.MemberOrder;
import dto.ReviewStarDTO;
import ListDAO.ProductDTO;
import mvc.controller.JDBConnect;

public class MVCBoardDAO extends JDBConnect{

	public MVCBoardDAO() {
		super();
	}

	//	cartId媛� orders table �뿉 �뾾�쓣 寃쎌슦 �궗�슜�옄媛� �엯�젰�븳 媛� insert
	public int insertWrite(MemberOrder memo) {

		System.out.println("insertWrite �떆�옉!");
		int Result = 0;

		String query = "insert into orders( "
				+ " memberId,addressee,extraAddr,status,totalPrice,phone,email,orderMsg) "
				+ " values( "
				+ " ?,?,?,?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memo.getMemberId());
			psmt.setString(2, memo.getAddressee());
			psmt.setString(3, memo.getExtraAddr());
			psmt.setString(4, memo.getStatus());
			psmt.setString(5, memo.getTotalPrice());
			psmt.setString(6, memo.getPhone());
			psmt.setString(7, memo.getEmail());
			psmt.setString(8, memo.getOrderMsg());

			Result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertWrite �뾽�뜲�씠�듃 以� �삤瑜섎컻�깮");
			e.printStackTrace();
		}

		System.out.println("insertWrite �뾽�뜲�씠�듃 �꽦怨�!");
		return Result;

	}
	
	public ProductDTO SelectSlideProduct(String p_category, int num){
		String sql="select * from product where p_category=? limit ?,1"; 
		ProductDTO dto = new ProductDTO();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, p_category);
			psmt.setInt(2, num);
			rs = psmt.executeQuery();

			if(rs.next()) {
				dto.setP_id(rs.getInt("p_id"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_unitPrice(rs.getString("p_unitPrice"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_manufacturer(rs.getString("p_manufacturer"));
				dto.setP_fileName(rs.getString("p_filename"));
				dto.setP_description(rs.getString("p_description"));
				dto.setP_gender(rs.getString("p_gender"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;

}	

	public int SelectProductCount_category(String p_category){
		String sql="select count(p_category) cnt from product where p_category=?"; 
		int count =0;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, p_category);
			rs = psmt.executeQuery();

			if(rs.next()) {
				count =rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}


	//	cartId媛� orders table �뿉 �엳�쓣 寃쎌슦 �궗�슜�옄媛� �엯�젰�븳 媛� update
	public int updateWrite(MemberOrder memo) {

		System.out.println("updateWrite �떆�옉!");
		int Result = 0;

		String query = "UPDATE orders "
				+ " SET status = ?,extraAddr = ?,addressee = ?,totalPrice = ?,phone = ?, email = ?,orderMsg = ? "
				+ " WHERE memberId  = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memo.getStatus());
			psmt.setString(2, memo.getExtraAddr());
			psmt.setString(3, memo.getAddressee());
			psmt.setString(4, memo.getTotalPrice());
			psmt.setString(5, memo.getPhone());
			psmt.setString(6, memo.getEmail());
			psmt.setString(7, memo.getOrderMsg());
			psmt.setString(8, memo.getMemberId());

			Result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateWrite �뾽�뜲�씠�듃 以� �삤瑜섎컻�깮");
			e.printStackTrace();
		}

		System.out.println("updateWrite �뾽�뜲�씠�듃 �꽦怨�!");
		return Result;

	}

	//	product,member,cart �뿉�꽌 媛� 媛��졇�삤湲�	
	public List<MemberOrder> selectView(String memberId) { 
		System.out.println("selectView �떆�옉!!!!!!!!!");

		List<MemberOrder> list = new ArrayList<MemberOrder>();

		String sql = "select address,phone,name,p_fileName,p_description,memberId,p_name, p_unitPrice,productCount,productSize,productColor ";
		sql += " from member m, cart c, product p ";
		sql += " where m.id = c.memberId and p.p_id = c.productId and c.memberId = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberOrder memo  = new MemberOrder();
				memo.setPhone(rs.getString("phone"));
				memo.setMemberAddr(rs.getString("address"));
				memo.setName(rs.getString("name"));
				memo.setP_fileName(rs.getString("p_fileName"));
				memo.setP_description(rs.getString("p_description"));
				memo.setMemberId(rs.getString("memberId"));
				memo.setP_name(rs.getString("p_name"));
				memo.setP_unitPrice(rs.getString("p_unitPrice").replace(",", ""));
				memo.setProductCount(rs.getString("productCount"));
				memo.setProductSize(rs.getString("productSize"));
				memo.setProductColor(rs.getString("productColor"));
				System.out.println("selectView//memo : "+ memo);
				list.add(memo);
				System.out.println("selectView//list : "+ list);
			}
		} catch (Exception e) {
			System.out.println("selectView �뾽�뜲�씠�듃 以� �삤瑜섎컻�깮");
			e.printStackTrace();
		}
		System.out.println("selectView �뾽�뜲�씠�듃 �꽦怨�!");
		return list;		
	}

	//	orders table�뿉 �엳�뒗 媛믪쓣 諛섑솚
	public MemberOrder orderSelectView(String memberId) { 
		System.out.println("orderSelectView �떆�옉!");

		MemberOrder memo  = new MemberOrder();

		String sql = "SELECT orderId,memberId,status,extraAddr,addressee,create_timestamp,totalPrice,phone,email,orderMsg FROM orders ";
		sql += " where memberId = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			while(rs.next()) {
				memo.setOrderId(rs.getString("orderId"));
				memo.setMemberId(rs.getString("memberId"));
				memo.setStatus(rs.getString("status"));
				memo.setExtraAddr(rs.getString("extraAddr"));
				memo.setAddressee(rs.getString("addressee"));
				memo.setPhone(rs.getString("phone"));
				memo.setCreate_timestamp(rs.getString("create_timestamp"));
				memo.setTotalPrice(rs.getString("totalPrice"));
				memo.setOrderMsg(rs.getString("orderMsg"));
				memo.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println("orderSelectView �뾽�뜲�씠�듃以� �삤瑜섎컻�깮!");
			e.printStackTrace();
		}
		System.out.println("orderSelectView �꽦怨�!");
		return memo;		
	}

	//	cartId媛� �벑濡앸릺�뼱 �엳�뒗 媛믪씤吏� �븘�땶吏� �솗�씤
	public int memberIdConfirmation(String memberId) { 
		System.out.println("memberIdConfirmation �떆�옉!");
		int resultSet = 0;	
		String sql = "SELECT memberId FROM orders ";
		sql += " where memberId = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				resultSet = 1;
				System.out.println("memberIdConfirmation//�벑濡앸릺�뼱�엳�뒗 �옣諛붽뎄�땲�엯�땲�떎.");
			}
		} catch (Exception e) {
			System.out.println("memberIdConfirmation �떎�뻾以� �삤瑜섎컻�깮!");
			e.printStackTrace();
		}
		System.out.println("memberIdConfirmation �꽦怨�!");
		return resultSet;		
	}
	

	public int deletePost(String memberId) {
		System.out.println("deletePost �떆�옉!!");
		int result = 0;
		try {
			String query = "DELETE FROM orders WHERE memberId=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberId);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("deletePost 吏꾪뻾 以� �삤瑜� 諛쒖깮");
			e.printStackTrace();
		}
		System.out.println("deletePost �꽦怨�!!");
		return result;
	}
	
	public int deleteCart(String memberId) {
		System.out.println("deleteCart 접속!!");
		int result = 0;
		try {
			String query = "DELETE FROM cart WHERE memberId=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberId);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("deleteCart 진행중 오류발생!");
			e.printStackTrace();
		}
		System.out.println("deleteCart 완료!!");
		return result;
	}




	public ProductDTO pSelectView(String id) { 
		ProductDTO dto  = new ProductDTO();	
		String sql = "SELECT * FROM product ";
		sql += " WHERE p_id = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setP_id(rs.getInt("p_id"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_unitPrice(rs.getString("p_unitPrice"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_manufacturer(rs.getString("p_manufacturer"));
				dto.setP_fileName(rs.getString("p_filename"));
				dto.setP_description(rs.getString("p_description"));
				dto.setP_gender(rs.getString("p_gender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;		
	}

	public List<ProductDTO> SelectSizeView(String id) { 
		List<ProductDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM psize where s_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				ProductDTO dto = new ProductDTO();	
				dto.setP_size(rs.getString("s_size"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;		
	}

	public List<ProductDTO> SelectColorView(String id) { 
		List<ProductDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM pcolor where c_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				ProductDTO dto = new ProductDTO();	
				dto.setP_color(rs.getString("c_color"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;		
	}


	public String SelectCountReview(String id){
		String count="";
		String sql="select count(p_id) cnt from star_review where p_id=?" ; 
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if(rs.next()) {
				count=rs.getString("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;

	}


	public int ReviewInsert(String m_id,String p_id,String content,String star) {
		int Result = 0;

		String query = "insert into star_review( "
				+ " m_id,p_id,star,content) "
				+ " values( "
				+ " ?,?,?,?)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, m_id);
			psmt.setString(2, p_id);
			psmt.setString(3, star);
			psmt.setString(4, content);

			Result = psmt.executeUpdate();


		} catch (SQLException e) {
			System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�듃 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�뙥�궪�삕");
			e.printStackTrace();
		}

		System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�듃 �뜝�룞�삕�뜝�룞�삕!");
		return Result;

	}

	public int insertProduct(ProductDTO dto) {
		int rs = 0;
		String sql = "insert into product (p_name, p_unitPrice, p_category, ";
		sql += " p_manufacturer, p_fileName, p_description, p_gender) ";
		sql +=" values (?, ?, ?, ?, ?, ?, ?)";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getP_name());
			psmt.setString(2, dto.getP_unitPrice());
			psmt.setString(3, dto.getP_category());
			psmt.setString(4, dto.getP_manufacturer());
			psmt.setString(5, dto.getP_fileName());
			psmt.setString(6, dto.getP_description());
			psmt.setString(7, dto.getP_gender());
			rs = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public List<ReviewStarDTO> SelectReview(String id){
		String sql="select * from star_review where p_id=? order by `index` desc"; 
		List<ReviewStarDTO> reviewList = new ArrayList<>();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				ReviewStarDTO reviewstar = new ReviewStarDTO();
				reviewstar.setM_id(rs.getString("m_id"));
				reviewstar.setP_id(rs.getString("p_id"));
				reviewstar.setContent(rs.getString("content"));
				reviewstar.setStar(rs.getString("star"));
				reviewstar.setIndex(rs.getString("index"));
				reviewList.add(reviewstar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviewList;

	}


	public List<ReviewStarDTO> SelectStarReView(String p_id, Map<String, Object> map){
		String sql="select * from star_review where p_id=? order by `index` desc limit ?,5"; 
		List<ReviewStarDTO> reviewList = new ArrayList<>();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, p_id);
			psmt.setInt(2, (int) map.get("start")-1);
			rs = psmt.executeQuery();

			while(rs.next()) {
				ReviewStarDTO reviewstar = new ReviewStarDTO();
				reviewstar.setM_id(rs.getString("m_id"));
				reviewstar.setP_id(rs.getString("p_id"));
				reviewstar.setContent(rs.getString("content"));
				reviewstar.setStar(rs.getString("star"));
				reviewstar.setPostdate_ymd(rs.getDate("postdate"));
				reviewstar.setPostdate_hms(rs.getTime("postdate"));
				reviewstar.setIndex(rs.getString("index"));
				reviewstar.setTitle(rs.getString("title"));
				reviewList.add(reviewstar);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviewList;


	}

	public int ReviewInsert(String m_id,String p_id,String content,String star,String title) {
		int Result = 0;

		String query = "insert into star_review( "
				+ " m_id,p_id,star,content,title) "
				+ " values( "
				+ " ?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, m_id);
			psmt.setString(2, p_id);
			psmt.setString(3, star);
			psmt.setString(4, content);
			psmt.setString(5, title);

			Result = psmt.executeUpdate();


		} catch (SQLException e) {
			System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�듃 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�뙥�궪�삕");
			e.printStackTrace();
		}

		System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�듃 �뜝�룞�삕�뜝�룞�삕!");
		return Result;

	}

	public ReviewStarDTO SelectReviewOne(int index) { 
		ReviewStarDTO review  = new ReviewStarDTO();	
		String sql = "select *from star_review";
		sql += " WHERE `index` = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, index);
			rs = psmt.executeQuery();
			if(rs.next()) {
				review.setContent(rs.getString("content"));
				review.setIndex(rs.getString("index"));
				review.setM_id(rs.getString("m_id"));
				review.setP_id(rs.getString("p_id"));
				review.setStar(rs.getString("star"));
				review.setTitle(rs.getString("title"));
				review.setPostdate_ymd(rs.getDate("postdate"));
				review.setPostdate_hms(rs.getTime("postdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return review;		
	}

	public int DeleteReview(int index) {
		int rs = 0;

		String sql = "delete from star_review where `index` = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, index);

			rs = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public ReviewStarDTO SelectStarReViewOne(int index ){
		String sql="select * from star_review where `index`=?"; 
		ReviewStarDTO reviewstar = new ReviewStarDTO();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1,index);
			rs = psmt.executeQuery();

			if(rs.next()) {
				reviewstar.setM_id(rs.getString("m_id"));
				reviewstar.setP_id(rs.getString("p_id"));
				reviewstar.setContent(rs.getString("content"));
				reviewstar.setStar(rs.getString("star"));
				reviewstar.setPostdate_ymd(rs.getDate("postdate"));
				reviewstar.setPostdate_hms(rs.getTime("postdate"));
				reviewstar.setIndex(rs.getString("index"));
				reviewstar.setTitle(rs.getString("title"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviewstar;
	}

	public int UpdateReview(int index,String content,String title,String star) {
		int rs = 0;
		String sql = "update star_review set content = ?,title = ?, star=?where `index`= ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, star);
			psmt.setInt(4, index);
			rs = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}




}	
