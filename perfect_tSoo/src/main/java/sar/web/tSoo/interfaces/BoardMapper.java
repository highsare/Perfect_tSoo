package sar.web.tSoo.interfaces;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import sar.web.tSoo.VO.TBoard;
import sar.web.tSoo.VO.TReply;

@Mapper
public interface BoardMapper {
	//게시글 작성
	public void insertBoard(TBoard board);
	
	//게시글 전체 불러오기
	public ArrayList<TBoard> selectAllBoard(RowBounds rb);
	
	//게시글 열람
	public TBoard selectOneBoard(int bNum);
	
	//게시글 삭제
	public void deleteOneBoard(int bNum); 
	
	//게시글 수정
	public void updateOneBoard(TBoard board);
	
	//게시글 조회수 증가
	public void addHits(int bNum);
	
	//리플 작성
	public void insertReply(TReply reply);
	
	//리플 삭제
	public void deleteReply(int rNum);
	
	//리플 불러오기
	public ArrayList<TReply> selectAllReply();
	
	//게시글 총 개수
	public int numOfBoards();
}
