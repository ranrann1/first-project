package ez_phone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ez_phone.dto.CartDTO;

public class CartDAO extends JdbcDAO {
	private static CartDAO _dao;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CartDAO();
	}
	
	public static CartDAO getDAO() {
		return _dao;
	}
	
	//제품정보를 전달받아 CART 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertCart(CartDTO cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into cart values(cart_seq.nextval,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cart.getId());
			pstmt.setString(2, cart.getP_code());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertCart 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//제품번호를 전달받아 CART 테이블에 저장된 제품정보를 검색하여 반환하는 메소드
	public CartDTO selectProduct(String p_code) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartDTO cart=null;
		try {
			con=getConnection();
			
			String sql="select p_name,p_color,p_size,p_image,p_price,p_stock from cart,product where product.p_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_code);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cart=new CartDTO();
				cart.setP_name(rs.getString("p_name"));
				cart.setP_color(rs.getString("p_color"));
				cart.setP_size(rs.getString("p_size"));
				cart.setP_size(rs.getString("p_image"));
				cart.setP_price(rs.getInt("p_price"));
				cart.setP_stock(rs.getInt("p_stock"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}	
		return cart;
	}
	
	//ID를 전달받아 CART 테이블에 저장된 제품정보를 검색하여 반환하는 메소드
	public CartDTO selectMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartDTO cart=null;
		try {
			con=getConnection();
			
		String sql="select cart.id,name,zipcode,address_1,address_2 from cart,member where member.id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
				
		rs=pstmt.executeQuery();
					
			if(rs.next()) {
				cart=new CartDTO();
				cart.setName(rs.getString("name"));
				cart.setId("id");
				cart.setZipcode(rs.getString("zipcode"));
				cart.setAddress_1(rs.getString("address_1"));
				cart.setAddress_2(rs.getString("address_2"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}	
		return cart;
	}
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteCart(String p_code) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from cart where p_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_code);
						
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows;
	}
	
	//CART 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
	public List<CartDTO> selectCartList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartDTO> cartList=new ArrayList<CartDTO>();
		try {
			con=getConnection();
			
			String sql="select DISTINCT product.p_code,p_name,p_image,p_image2,p_price,p_stock,p_color,p_size "
					+ "from cart,product where cart.p_code=product.p_code";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
		
			while(rs.next()) {
				CartDTO cart=new CartDTO();
				cart.setP_code(rs.getString("p_code"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_color(rs.getString("p_color"));
				cart.setP_size(rs.getString("p_size"));
				cart.setP_image(rs.getString("p_image"));
				cart.setP_price(rs.getInt("p_price"));
				cart.setP_stock(rs.getInt("p_stock"));
				cartList.add(cart);
			}
	} catch (SQLException e) {
			System.out.println("[에러]selectCartList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
	//CART 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
		public List<CartDTO> selectCmemberList(String id) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<CartDTO> cmemberList=new ArrayList<CartDTO>();
			try {
				con=getConnection();
				
				String sql="select cart.id from cart,member where cart.id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
			
				while(rs.next()) {
					CartDTO cart=new CartDTO();
					cart.setP_code(rs.getString("id"));
					cmemberList.add(cart);
				}
		} catch (SQLException e) {
				System.out.println("[에러]selectCmemberList 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return cmemberList;
		}
}
