package sar.web.tSoo.DAO;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import sar.web.tSoo.VO.TBoard;
import sar.web.tSoo.VO.TReply;
import sar.web.tSoo.interfaces.BoardMapper;

@Repository
public class BoardDAO implements BoardMapper {
	
	@Inject
	SqlSession session;

	@Override
	public void insertBoard(TBoard board) {
		// TODO Auto-generated method stub
		session.getMapper(BoardMapper.class).insertBoard(board);
	}

	@Override
	public ArrayList<TBoard> selectAllBoard(RowBounds rb) {
		// TODO Auto-generated method stub
		return session.getMapper(BoardMapper.class).selectAllBoard(rb);
	}

	@Override
	public TBoard selectOneBoard(int bNum) {
		// TODO Auto-generated method stub
		return session.getMapper(BoardMapper.class).selectOneBoard(bNum);
	}

	@Override
	public void deleteOneBoard(int bNum) {
		// TODO Auto-generated method stub
		session.getMapper(BoardMapper.class).deleteOneBoard(bNum);
	}

	@Override
	public void updateOneBoard(TBoard board) {
		// TODO Auto-generated method stub
		session.getMapper(BoardMapper.class).updateOneBoard(board);
	}

	@Override
	public void addHits(int bNum) {
		// TODO Auto-generated method stub
		session.getMapper(BoardMapper.class).addHits(bNum);
	}

	@Override
	public void insertReply(TReply reply) {
		// TODO Auto-generated method stub
		session.getMapper(BoardMapper.class).insertReply(reply);
	}

	@Override
	public void deleteReply(int rNum) {
		// TODO Auto-generated method stub
		session.getMapper(BoardMapper.class).deleteReply(rNum);
	}

	@Override
	public ArrayList<TReply> selectAllReply() {
		// TODO Auto-generated method stub
		return session.getMapper(BoardMapper.class).selectAllReply();
	}

	@Override
	public int numOfBoards() {
		// TODO Auto-generated method stub
		return session.getMapper(BoardMapper.class).numOfBoards();
	}

}
