package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CartDTO;
import mvc.controller.JDBConnect;

public class MVCCartDAO extends JDBConnect{

	public MVCCartDAO() {
		super();
	}

	// (燁삳똾�뱜 �빊遺쏙옙) 占쎈�믭옙�뵠�뇡占� 占쎈립 占쎈뻬占쎌뱽 insert 占쎈릭占쎈뮉 筌롫뗄苑뚳옙諭� 
	// insert 占쎄쉐�⑤벊�뻻 獄쏆꼹�넎 1, 占쎈뼄占쎈솭占쎈뻻 0
	public int addCart2(CartDTO cart) {
		System.out.println("addCart()");
		int rs = 0;

		String query = "INSERT INTO cart( "
				+ " memberId, productId, productCount) "
				+ " VALUES(?, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, cart.getMemberId());
			psmt.setInt(2, cart.getProductId());
			psmt.setInt(3, cart.getProductCount());
			rs = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("INSERT餓ο옙 占쎌궎�몴占� 獄쏆뮇源�");
			e.printStackTrace();
		}

		System.out.println(query);
		System.out.println(rs);
		return rs;
	}

	// (燁삳똾�뱜 筌뤴뫖以�) 筌욑옙占쎌젟占쎈립 占쎌돳占쎌뜚占쎌벥 筌뤴뫀諭� cart 占쎈뻬占쎌뱽 揶쏉옙占쎌죬占쎌궎疫뀐옙 占쎌맄占쎈립 筌롫뗄苑뚳옙諭� 
	// 占쎈립揶쏉옙 占쎌뵠占쎄맒占쎌벥 占쎌삢獄쏅떽�럡占쎈빍 占쎈쑓占쎌뵠占쎄숲�몴占� 獄쏆꼹�넎獄쏆룇釉섓옙鍮� 占쎈릭疫꿸퀡釉ｈ눧紐꾨퓠 List<CartDTO>
	public List<CartDTO> getCartList(String memberId) {
		System.out.println("getCart()");
		ArrayList<CartDTO> cartList = new ArrayList<CartDTO>();

		String sql = "SELECT c.cartId, c.memberId, c.productId, c.productCount, "
				+ " c.productSize, c.productColor, p.p_name, p.p_unitPrice, p.p_fileName "
				+" FROM cart c LEFT OUTER JOIN product p "
				+" ON c.productId = p.p_id "
				+" WHERE c.memberId = ?";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();

			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCartId(rs.getInt("cartId"));
				cart.setMemberId(rs.getString("memberId"));
				cart.setProductId(rs.getInt("productId"));
				cart.setProductCount(rs.getInt("productCount"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_unitPrice(rs.getString("p_unitPrice"));
				cart.setProductSize(rs.getString("productSize"));
				cart.setProductColor(rs.getString("productColor"));
				cart.setP_fileName(rs.getString("p_fileName"));
				cartList.add(cart);
			}

			// 占쎌넇占쎌뵥占쎌뒠
			for(CartDTO cart : cartList) {
				System.out.println(cart.toString()+"\n");
			}

		} catch (Exception e) {
			System.out.println("getCart SELECT餓ο옙 占쎌궎�몴占� 獄쏆뮇源�");
			e.printStackTrace();
		}
		return cartList;
	}

	// �룯占� 野껊슣�뻻�눧�눘�땾
	public int getListCount(String memberId) {

		int x = 0;

		String sql;

		sql = "select count(*) from cart where memberId = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();

			if (rs.next()) 	x = rs.getInt(1);

		} catch (Exception ex) {
			System.out.println("getListCount() 占쎌궎�몴占� 獄쏆뮇源�: " + ex);
		} 
		return x;
	}

	// (雅뚯눖揆占쎈립 占쎄맒占쎈�뱄옙�뵠 燁삳똾�뱜占쎈퓠 占쎌뵠沃섓옙 占쎌뿳占쎈뮉筌욑옙)  占쎌돳占쎌뜚占쎌젟癰귣똻占� 占쎄맒占쎈�뱄옙�젟癰귣�占쏙옙 占쎄퐜野꺿뫁苑� 域뱄옙 占쎈뻬占쎌뵠 占쎌뿳占쎈뮉筌욑옙 占쎌넇占쎌뵥占쎈릭占쎈뮉 筌롫뗄苑뚳옙諭� 
	// 鈺곌퀗援뷂옙肉� 筌띿쉶�뮉 占쎈뻬占쎌벥 �뚎됱쓥揶쏅�れ뱽 揶쏉옙占쎌죬占쎌궎占쎈즲嚥∽옙 CartDTO嚥∽옙 占쎈뻥占쎈뼄占쎈뮉占쎈쑓 占쎈툡筌욑옙 �맱遺용꺖�뵳怨쀯옙 筌뤾퀗荑뗰옙�벉
	public CartDTO checkCart(CartDTO cart) { 

		System.out.println("checkCart()");
		CartDTO rsCart = new CartDTO();
		String sql = "SELECT * FROM cart "
				+" WHERE memberId = ? AND productId = ? ";
		System.out.println(sql);

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cart.getMemberId());
			psmt.setInt(2, cart.getProductId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				rsCart.setCartId(rs.getInt("cartId"));
				rsCart.setMemberId(rs.getString("memberId"));
				rsCart.setProductId(rs.getInt("productId"));
				rsCart.setProductCount(rs.getInt("productCount"));
			}
		} catch (Exception e) {
			System.out.println("checkCart SELECT餓ο옙 占쎌궎�몴占� 獄쏆뮇源�");
			e.printStackTrace();
		}

		// 占쎌넇占쎌뵥占쎌뒠
		System.out.println(rsCart.toString());
		return rsCart;		
	}

	// (燁삳똾�뱜 占쎈땾占쎌쎗 占쎈땾占쎌젟) 占쎈�믭옙�뵠�뇡占� 占쎈립 占쎈뻬占쎌벥 占쎈땾占쎌쎗揶쏅�れ뱽 癰귨옙野껋�釉�占쎈뮉 筌롫뗄苑뚳옙諭� 
	// update 占쎄쉐�⑤벊�뻻 獄쏆꼹�넎 1, 占쎈뼄占쎈솭占쎈뻻 0
	public int modifyCount(CartDTO cart) { 
		System.out.println("modifyCount()");
		int rs = 0;

		String sql = "UPDATE cart SET productCount = ? "
				+ " WHERE cartId = ?";

		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, cart.getProductCount()); // 占쎌뵠椰꾬옙 筌띿쉶�뮉椰꾧퀣�뿫? 癰귨옙野껋�釉� 占쎈땾占쎌쎗占쎌뵥占쎈쑓 cart占쎈퓠占쎄퐣 揶쏉옙占쎌죬占쎌궎筌롳옙 占쎈툧占쎈┷占쎈뮉野껉퍒而놂옙�벉
			psmt.setInt(1, cart.getCartId());
			rs = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("modifyCount update餓ο옙 占쎌궎�몴占� 獄쏆뮇源�");
			e.printStackTrace();
		}

		return rs;		
	}

	// (燁삳똾�뱜 占쎄텣占쎌젫) 占쎈�믭옙�뵠�뇡占� 占쎈립 占쎈뻬占쎌뱽 delete 占쎈릭占쎈뮉 筌롫뗄苑뚳옙諭�
	// delete 占쎄쉐�⑤벊�뻻 獄쏆꼹�넎 1, 占쎈뼄占쎈솭占쎈뻻 0
	public int deleteCart(String memberId) { 
		System.out.println("deleteCart()");
		int rs = 0;
		String sql = "DELETE FROM cart WHERE memberId = ?";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("DELETE 餓ο옙 占쎌궎�몴占� 獄쏆뮇源�");
			e.printStackTrace();
		}
		return rs;		
	}

	// (筌ㅼ뮇伊� 燁삳똾�뱜 �빊遺쏙옙) checkCart占쎌삂 modifyCount addCart2�몴占� 占쎈�燁삼옙
	// 占쎈즼占쎌젻獄쏆룇�뱽 揶쏉옙 占쎈씨占쎌몵占쎈빍繹먲옙 void
	public void addCart(String memberId , String p_id, String productSize, String productColor) {
		System.out.println("addCartDAO");
		int x=0;
		String sql = "SELECT productCount FROM cart ";
		sql += " WHERE memberId = ? AND productId = ? AND productSize = ? AND productColor = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setString(2, p_id);
			psmt.setString(3, productSize);
			psmt.setString(4, productColor);
			rs = psmt.executeQuery();	
			if (rs.next()) 	x = rs.getInt(1);
			if(x>0) {
				String query = "UPDATE cart SET productCount = " +x+ "+1 "
						+ " WHERE memberId = ? AND productId = ? AND productSize = ? AND productColor = ?";
				psmt = con.prepareStatement(query);
				psmt.setString(1, memberId);
				psmt.setString(2, p_id);
				psmt.setString(3, productSize);
				psmt.setString(4, productColor);
				psmt.executeUpdate();
				System.out.println("占쎌뵠沃섓옙 占쎌뿳占쎌벉 " +x+ ">>>> " +query);
			}else {
				String query = "INSERT INTO cart( "
						+ "	memberId, productId, productCount, productSize, productColor) "
						+ "	VALUES(?, ?, ?, ?, ?)";
				psmt = con.prepareStatement(query);
				psmt.setString(1, memberId);
				psmt.setString(2, p_id);
				psmt.setInt(3, 1);
				psmt.setString(4, productSize);
				psmt.setString(5, productColor);
				psmt.executeUpdate();
				System.out.println("占쎈씨占쎌벉 " +x+ ">>>> " +query);
			}
		} catch (Exception e) {
		}
	}

	// (燁삳똾�뱜 占쎄텣占쎌젫) 占쎈�믭옙�뵠�뇡占� 占쎈립 占쎈뻬占쎌뱽 delete 占쎈릭占쎈뮉 筌롫뗄苑뚳옙諭�
	// delete 占쎄쉐�⑤벊�뻻 獄쏆꼹�넎 1, 占쎈뼄占쎈솭占쎈뻻 0
	public int removeCart(int cartId) { 
		System.out.println("removeCart()");
		int rs = 0;
		String sql = "DELETE FROM cart WHERE cartId = ?";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, cartId);
			rs = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("REMOVE 餓ο옙 占쎌궎�몴占� 獄쏆뮇源�");
			e.printStackTrace();
		}
		return rs;		
	}
	
	public int cartConfirmation(String memberId) { 
		System.out.println("cartConfirmation �떆�옉!");
		int resultSet = 0;	
		String sql = "SELECT memberId FROM cart ";
		sql += " where memberId = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				resultSet = 1;
				System.out.println("cartConfirmation//�벑濡앸릺�뼱�엳�뒗 �옣諛붽뎄�땲�엯�땲�떎.");
			}
		} catch (Exception e) {
			System.out.println("cartConfirmation �떎�뻾以� �삤瑜섎컻�깮!");
			e.printStackTrace();
		}
		System.out.println("cartIdConfirmation �꽦怨�!");
		return resultSet;		
	}

}	
