package ez_phone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ez_phone.dto.BoardDTO;


public class BoardDAO extends JdbcDAO{
private static BoardDAO _dao;
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new BoardDAO();
	}
	
	public static BoardDAO getDAO() {
		return _dao;
	}
	
	//board 테이블에 저장된 개인 문의글을  날짜순으로 정렬되도록 검색하여 반환 하는 메소드 
	
	public List<BoardDTO> selectBoardList(String member_id){
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		try {
			con=getConnection();
			
			String sql="select b_code, b_title, b_date, b_status from board join member on board.id = member.id where member.ID='" + member_id + "' order by b_date";

			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				board.setB_code(rs.getInt("b_code"));
				board.setB_title(rs.getString("b_title"));
				board.setB_date(rs.getString("b_date"));
				board.setB_status(rs.getInt("b_status"));
				boardList.add(board);
				
			}
		} catch (SQLException e) {
				System.out.println("[에러]selectBoardList 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
	
	//검색 관련 값을 전달받아 BOARD 테이블에 저장된 전체 게시글 중 검색컬럼에 검색어가 포함된
	//게시글의 갯수를 검색하여 반환하는 메소드 - 검색 기능 사용
	public int selectBoardCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			//매개변수에 전달된 값을 비교하여 다른 SQL 명령을 전달하여 실행되도록 설정
			// => 동적 SQL(Dynamic SQL) 기능 사용
			if(keyword.equals("")) { //검색 기능을 사용하지 않은 경우
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			} else { //검색 기능을 사용한 경우
				//검색대상은 값이 아니므로 ?(InParameter)로 표현 불가능 - 문자열 결합
				String sql="select count(*) from board where "+search+" like '%'||?||'%' and status=1";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBoardCount 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//시작 행번호와 종료 행번호를 전달받아 BOARD 테이블에 저장된 게시글에서 시작 행번호부터
	//종료 행번호 사이에 저장된 게시글을 검색하여 반환하는 메소드 - 검색 기능 사용
	public List<BoardDTO> selectBoardList2(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		try {
			con=getConnection();
			
			if(keyword.equals("")) {
				String sql="select * from (select rownum rn, temp.* from "
						+ "(select * from board) temp) "
						+ "where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from (select rownum rn, temp.* from "
						+ "(select * from board where "+search
						+" like '%'||?||'%' and b_status=1) temp) "
						+ "where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
						
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				board.setB_code(rs.getInt("b_code"));
				board.setId(rs.getString("id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_date(rs.getString("b_date"));
				board.setB_content(rs.getString("b_content"));
				board.setB_reply(rs.getString("b_reply"));
				board.setB_status(rs.getInt("b_status"));
				board.setB_check(rs.getInt("b_check"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBoardList2 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return boardList;
	}
	
	//BOARD_SEQ 시퀸스의 다음값을 검색하여 반환하는 메소드
	public int selectNextB_code() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextB_code=0;
		try {
			con=getConnection();
			
			String sql="select board_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextB_code=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextB_code 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextB_code;
	}
	
	//게시글을 전달받아 BOARD 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into board values(?,?,?,?,?,sysdate,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board.getB_code());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setString(5, board.getB_reply());
			pstmt.setInt(6, board.getB_status());
			pstmt.setInt(7, board.getB_check());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertBoard 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호를 전달받아 BOARD 테이블에 저장된 게시글을 검색하여 반환하는 메소드
	public BoardDTO selectBoard(int b_code) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO board=null;
		try {
			con=getConnection();
			
			String sql="select * from board where b_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b_code);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board=new BoardDTO();
				board.setB_code(rs.getInt("b_code"));
				board.setId(rs.getString("id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
				board.setB_reply(rs.getString("b_reply"));
				board.setB_date(rs.getString("b_date"));
				board.setB_status(rs.getInt("b_status"));
				board.setB_check(rs.getInt("b_check"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBoard 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return board;
	}
	
	//게시글을 전달받아 BOARD 테이블에 저장된 게시글을 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set b_title=?,b_content=?,b_reply=?,b_status=?,b_check=? where b_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_reply());
			pstmt.setInt(4, board.getB_status());
			pstmt.setInt(5, board.getB_check());
			pstmt.setInt(6, board.getB_code());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateBoard 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호를 전달받아 BOARD 테이블에 저장된 게시글의 상태를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateStatus(int b_code, int b_status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set b_status=? where b_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b_status);
			pstmt.setInt(2, b_code);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;		
	}
	
	//글번호를 전달받아 BOARD 테이블에 저장된 게시글의 상태를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateReply(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set b_reply=?,b_check=1 where b_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getB_reply());
			pstmt.setInt(2, board.getB_code());
			
			
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;		
	}
	
	//게시글 삭제(테이블에서도 삭제)
	public int deleteBoard(int b_code) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from board where b_code=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b_code);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteNotice 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
