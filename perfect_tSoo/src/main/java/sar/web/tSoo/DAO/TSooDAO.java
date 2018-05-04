package sar.web.tSoo.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import sar.web.tSoo.VO.TSoo;
import sar.web.tSoo.interfaces.TSooMapper;

@Repository
public class TSooDAO implements TSooMapper{

	@Inject
	SqlSession session;
	
	@Override
	public void insertTSoo(TSoo tSoo) {
		// TODO Auto-generated method stub
		session.getMapper(TSooMapper.class).insertTSoo(tSoo);
	}

	@Override
	public TSoo selectOneTSoo(String id) {
		// TODO Auto-generated method stub
		return session.getMapper(TSooMapper.class).selectOneTSoo(id);
	}

	@Override
	public void deleteTSoo(int pNum) {
		// TODO Auto-generated method stub
		session.getMapper(TSooMapper.class).deleteTSoo(pNum);
	}

	@Override
	public void updateTSoo(TSoo tSoo) {
		// TODO Auto-generated method stub
		session.getMapper(TSooMapper.class).updateTSoo(tSoo);
	}

	@Override
	public void updateFList(TSoo tSoo) {
		// TODO Auto-generated method stub
		session.getMapper(TSooMapper.class).updateFList(tSoo);
	}

	@Override
	public void updateCList(TSoo tSoo) {
		// TODO Auto-generated method stub
		session.getMapper(TSooMapper.class).updateCList(tSoo);
	}

}
