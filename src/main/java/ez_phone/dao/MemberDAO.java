package ez_phone.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ez_phone.dto.MemberDTO;


public class MemberDAO extends JdbcDAO {
	private static MemberDAO _dao;
	
	private MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MemberDAO();		
	}
	
	public static MemberDAO getDAO() {
		return _dao;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into member values(?,?,?,?,?,?,?,?,1,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getZipcode());
			pstmt.setString(5, member.getAddress_1());
			pstmt.setString(6, member.getAddress_2());
			pstmt.setString(7, member.getPhone_number());
			pstmt.setString(8, member.getE_mail());
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보를 검색하여 반환하는 메소드
	public MemberDTO selectMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO member=null;
		try {
			con=getConnection();
			
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member=new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress_1(rs.getString("address_1"));
				member.setAddress_2(rs.getString("address_2"));
				member.setPhone_number(rs.getString("phone_number"));
				member.setE_mail(rs.getString("e_mail"));
				member.setGrade(rs.getInt("grade"));
				member.setStatus(rs.getInt("status"));
			
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보의 마지막 로그인 날짜를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateLastLogin(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set last_login=sysdate where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateLastLogin 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set passwd=?,name=?"
					+ ",e_mail=?,phone_number=?,zipcode=?,address_1=?,address_2=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getE_mail());
			pstmt.setString(4, member.getPhone_number());
			pstmt.setString(5, member.getZipcode());
			pstmt.setString(6, member.getAddress_1());
			pstmt.setString(7, member.getAddress_2());
			pstmt.setString(8, member.getId());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//아이디와 상태정보를 전달받아 MEMBER 테이블에 저장된 회원의 상태정보를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateStatus(String id, int status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set status=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setString(2, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
	public List<MemberDTO> selectMemberList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDTO> memberList=new ArrayList<MemberDTO>();
		try {
			con=getConnection();
			
			String sql="select * from member order by id";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member=new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress_1(rs.getString("address_1"));
				member.setAddress_2(rs.getString("address_2"));
				member.setPhone_number(rs.getString("phone_number"));
				member.setE_mail(rs.getString("e_mail"));
				member.setGrade(rs.getInt("grade"));
				member.setStatus(rs.getInt("status"));
				
				memberList.add(member);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectMemberList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberList;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows;
	}
}








