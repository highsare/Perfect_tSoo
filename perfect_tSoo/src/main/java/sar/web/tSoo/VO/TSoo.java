package sar.web.tSoo.VO;

import java.util.ArrayList;

public class TSoo {
	private int pNum;
	private String id;
	private String password;
	private String nickname;
	private String fList;
	private String cList;
	
	public TSoo() {super();}

	public TSoo(int pNum, String id, String password, String nickname, String fList, String cList) {
		super();
		this.pNum = pNum;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.fList = fList;
		this.cList = cList;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getfList() {
		return fList;
	}

	public void setfList(String fList) {
		this.fList = fList;
	}

	public String getcList() {
		return cList;
	}

	public void setcList(String cList) {
		this.cList = cList;
	}

	@Override
	public String toString() {
		return "TSoo [pNum=" + pNum + ", id=" + id + ", password=" + password + ", nickname=" + nickname + ", fList="
				+ fList + ", cList=" + cList + "]";
	}
	
	
}
