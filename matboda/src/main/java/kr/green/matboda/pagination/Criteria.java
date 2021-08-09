package kr.green.matboda.pagination;

import lombok.Data;

@Data
public class Criteria {
	
	private int page; 
	private int perPageNum;
	private String type; 
	private String sortType;
	private String sort;
	private String search;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.sortType = "me_signupdate";
		this.sort = "desc";
		this.type = "NORMAL";
		this.search = "";
	}
	public Criteria(int page, int perPageNum) {
		this();
		this.page = page;
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	public String getNotSort() {
		if(sort.equals("desc"))
			return "asc";
		else
			return "desc";
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "Criteria [search=" + search + "]";
	}
}
