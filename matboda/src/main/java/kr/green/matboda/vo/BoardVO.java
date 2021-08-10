package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bo_num;
	private String bo_title;
	private String bo_contents;
	private String bo_me_id;
	private Date bo_regdate;
	private int bo_views;
	private String bo_type;
	private FileVO thumbnail;
	private String pw;
	public String getDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(bo_regdate);
	}
	public String getDateTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(bo_regdate);
	}
}
