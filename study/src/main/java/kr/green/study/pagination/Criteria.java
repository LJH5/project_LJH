package kr.green.study.pagination;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Criteria {
	
	private int page; 
	private int perPageNum;
	private String sortType;
	private String sort;	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.sortType = "id";
		this.sort = "asc";
	}
	
	public int getStartPage() {
		return (this.page -1) * perPageNum;
	}
	public String getNotSort() {
		if(sort.equals("asc"))
			return "desc";
		return "asd";
	}
}
