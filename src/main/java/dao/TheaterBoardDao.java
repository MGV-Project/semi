package dao;

import java.util.List;

import util.DaoHelper;
import vo.Location;
import vo.Member;
import vo.Theater;
import vo.TheaterBoard;

public class TheaterBoardDao {

	private static TheaterBoardDao instance = new TheaterBoardDao();
	private TheaterBoardDao() {}
	public static TheaterBoardDao getInstance() {
		return instance;
	}
	
	public void updateTheaterBoard(TheaterBoard theaterBoard) {
		DaoHelper.update("theaterBoardDao.updateBoardByNo" , theaterBoard.getName(),
															 theaterBoard.getContent(),
															 theaterBoard.getGrade(),
															 theaterBoard.getReadCnt(),
															 theaterBoard.getCommentCnt(),
															 theaterBoard.getDeleted(),
															 theaterBoard.getReport(),
															 theaterBoard.getNo());
	}
	
	public TheaterBoard getTheaterBoardByNo(int boardNo) {
		
		return DaoHelper.selectOne("theaterBoarDao.getBoardByNo", rs -> {
			TheaterBoard theaterBoard = new TheaterBoard();
			
			theaterBoard.setNo(rs.getInt("board_no"));
			theaterBoard.setName(rs.getString("board_name"));
			theaterBoard.setContent(rs.getString("board_content"));
			theaterBoard.setGrade(rs.getString("board_grade"));
			theaterBoard.setCreateDate(rs.getDate("board_create_date"));
			theaterBoard.setUpdateDate(rs.getDate("board_update_date"));
			theaterBoard.setReadCnt(rs.getInt("board_read_cnt"));
			theaterBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			theaterBoard.setDeleted(rs.getString("board_deleted"));
			theaterBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			theaterBoard.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			theaterBoard.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			theaterBoard.setLocation(location);
			
			return theaterBoard;
		}, boardNo);
	}
	
	public void insertTheaterBoard(TheaterBoard theaterBoard) {
		
		DaoHelper.update("theaterBoardDao.insertTheaterBoard" ,theaterBoard.getName(),
															   theaterBoard.getContent(),
															   theaterBoard.getGrade(),
															   theaterBoard.getMember().getId(),
															   theaterBoard.getTheater().getNo(),
															   theaterBoard.getLocation().getNo());	
		
	}
	
	public int getTotalRows() {
		
		return DaoHelper.selectOne("theaterBoardDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public List<TheaterBoard> getTheaterBoards(int begin, int end) {
		
		return DaoHelper.selectList("theaterBoardDao.getBoard", rs -> {
			TheaterBoard theaterBoard = new TheaterBoard();
			
			theaterBoard.setNo(rs.getInt("board_no"));
			theaterBoard.setName(rs.getString("board_name"));
			theaterBoard.setContent(rs.getString("board_content"));
			theaterBoard.setGrade(rs.getString("board_grade"));
			theaterBoard.setCreateDate(rs.getDate("board_create_date"));
			theaterBoard.setUpdateDate(rs.getDate("board_update_date"));
			theaterBoard.setReadCnt(rs.getInt("board_read_cnt"));
			theaterBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			theaterBoard.setDeleted(rs.getString("board_deleted"));
			theaterBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			theaterBoard.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theaterBoard.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			theaterBoard.setLocation(location);
			
			return theaterBoard;
		}, begin, end);
	}
	
	public List<TheaterBoard> getTheaterBoardsByLocationNo(int locationNo){
		return DaoHelper.selectList("theaterBoardDao.getBoardByLocationNo", rs -> {
			TheaterBoard theaterBoard = new TheaterBoard();
			
			theaterBoard.setNo(rs.getInt("board_no"));
			theaterBoard.setName(rs.getString("board_name"));
			theaterBoard.setContent(rs.getString("board_content"));
			theaterBoard.setGrade(rs.getString("board_grade"));
			theaterBoard.setCreateDate(rs.getDate("board_create_date"));
			theaterBoard.setUpdateDate(rs.getDate("board_update_date"));
			theaterBoard.setReadCnt(rs.getInt("board_read_cnt"));
			theaterBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			theaterBoard.setDeleted(rs.getString("board_deleted"));
			theaterBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			theaterBoard.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theaterBoard.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			theaterBoard.setLocation(location);
			
			return theaterBoard;
		}, locationNo);
	}
	
	public List<TheaterBoard> getTheaterBoardsByLocationNoAndTheaterNo(int locationNo, int theaterNo){
		return DaoHelper.selectList("theaterBoardDao.getBoardByLocationNoAndTheaterNo", rs -> {
			TheaterBoard theaterBoard = new TheaterBoard();
			
			theaterBoard.setNo(rs.getInt("board_no"));
			theaterBoard.setName(rs.getString("board_name"));
			theaterBoard.setContent(rs.getString("board_content"));
			theaterBoard.setGrade(rs.getString("board_grade"));
			theaterBoard.setCreateDate(rs.getDate("board_create_date"));
			theaterBoard.setUpdateDate(rs.getDate("board_update_date"));
			theaterBoard.setReadCnt(rs.getInt("board_read_cnt"));
			theaterBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			theaterBoard.setDeleted(rs.getString("board_deleted"));
			theaterBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			theaterBoard.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theaterBoard.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			theaterBoard.setLocation(location);
			
			return theaterBoard;
		}, locationNo, theaterNo);
	}
}