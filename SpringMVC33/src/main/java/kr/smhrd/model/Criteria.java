package kr.smhrd.model;

public class Criteria {

	//현재 페이지
	private int pageNum;
	//페이지당 게시물 갯수
	private	int amount;
	
	private int skip;
	public Criteria() {
		this(1,10);
		this.skip = 0;
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
		this.skip = (this.pageNum-1)*amount;
	}
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum +", amount=" + amount + "]";
	}
	
}
