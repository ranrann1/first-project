package ez_phone.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ez_phone.dto.CartDTO;
import ez_phone.dto.PaymentDTO;
/*
 * payment 테이블
 * 이름        널?       유형            
--------- -------- ------------- 
O_CODE    NOT NULL VARCHAR2(20)  주문번호(pk)
ID        NOT NULL VARCHAR2(50)  아이디(member fk)
P_CODE             VARCHAR2(50)  상품코드(product fk)
ZIPCODE            VARCHAR2(10)  우편번호
ADDRESS_1 NOT NULL VARCHAR2(200) 주소
ADDRESS_2 NOT NULL VARCHAR2(50)  상세주소
O_DATE    NOT NULL DATE          주문일자
O_CHECK   NOT NULL VARCHAR2(1)   주문확인 
*/

/*
 * product 테이블
 * 이름       널?       유형            
-------- -------- ------------- 
P_CODE   NOT NULL VARCHAR2(50)  
P_NAME   NOT NULL VARCHAR2(50)  
P_IMAGE  NOT NULL VARCHAR2(500) 
P_IMAGE2 NOT NULL VARCHAR2(500) 
P_PRICE  NOT NULL NUMBER(20)    
P_STOCK  NOT NULL NUMBER(20)    
P_COLOR  NOT NULL VARCHAR2(20)  
P_SIZE   NOT NULL VARCHAR2(20)  
*/
public class PaymentDAO extends JdbcDAO{
private static PaymentDAO _dao;
	
	public PaymentDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new PaymentDAO();
	}
	
	public static PaymentDAO getDAO() {
		return _dao;
	}
	//payment 테이블에 저장된 결제완료된 상품 정보를 날짜순으로 정렬되도록 검색하여 반환 하는 메소드 
	
	public List<PaymentDTO> selectPaymentList(String member_id){
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PaymentDTO> paymentList=new ArrayList<PaymentDTO>();
		try {
			con=getConnection();
			
			String sql="select o_code, p_name, p_price, o_check from payment join product on payment.p_code = product.p_code where ID='" + member_id + "' order by o_date";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				PaymentDTO payment=new PaymentDTO();
				payment.setO_code(rs.getString("o_code"));
				payment.setP_name(rs.getString("p_name"));
				payment.setP_price(rs.getInt("p_price"));
				payment.setO_check(rs.getString("o_check"));
				paymentList.add(payment);
			}
		} catch (SQLException e) {
				System.out.println("[에러]selectPaymentList 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return paymentList;
		}
	
	//결제정보를 전달받아 payment 테이블에 삽입하는 메소드
		public int insertPayment(PaymentDTO payment) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="insert into payment values(payment_seq.nextval,?,?,?,?,?,sysdate,1)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, payment.getId());
				pstmt.setString(2, payment.getP_code());
				pstmt.setString(3, payment.getZipcode());
				pstmt.setString(4, payment.getAddress_1());
				pstmt.setString(5, payment.getAddress_2());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]insertPayment 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
		public int deleteCart() {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="delete from cart ";
				pstmt=con.prepareStatement(sql);
							
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]deleteMember 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			} 
			return rows;
		}
	}





