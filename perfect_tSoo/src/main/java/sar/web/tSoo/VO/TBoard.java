package sar.web.tSoo.VO;

public class TBoard {
	private int bNum;
	private String id;
	private String title;
	private String context;
	private String inputDate;
	private int hits;
	
	public TBoard() {super();}

	public TBoard(int bNum, String id, String title, String context, String inputDate, int hits) {
		super();
		this.bNum = bNum;
		this.id = id;
		this.title = title;
		this.context = context;
		this.inputDate = inputDate;
		this.hits = hits;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "TBoard [bNum=" + bNum + ", id=" + id + ", title=" + title + ", context=" + context + ", inputDate="
				+ inputDate + ", hits=" + hits + "]";
	}
}
