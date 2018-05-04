package sar.web.tSoo.VO;

public class TReply {
	private int rNum;
	private int bNum;
	private String id;
	private String context;
	private String inputDate;
	
	public TReply() {super();}

	public TReply(int rNum, int bNum, String id, String context, String inputDate) {
		super();
		this.rNum = rNum;
		this.bNum = bNum;
		this.id = id;
		this.context = context;
		this.inputDate = inputDate;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "TReply [rNum=" + rNum + ", bNum=" + bNum + ", id=" + id + ", context=" + context + ", inputDate="
				+ inputDate + "]";
	}
	
}
