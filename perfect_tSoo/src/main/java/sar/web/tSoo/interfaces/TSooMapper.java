package sar.web.tSoo.interfaces;

import org.apache.ibatis.annotations.Mapper;

import sar.web.tSoo.VO.TSoo;

@Mapper
public interface TSooMapper {
	//가입
	public void insertTSoo(TSoo tSoo);
	
	//트수 셀렉트
	public TSoo selectOneTSoo(String id);
	
	//탈퇴
	public void deleteTSoo(int pNum);
	
	//개인 정보 수정
	public void updateTSoo(TSoo tSoo);
	
	//팔로우 리스트 변경
	public void updateFList(TSoo tSoo);
	
	//채팅 리스트 변경
	public void updateCList(TSoo tSoo);
}
