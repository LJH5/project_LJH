package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int re_num;
	private String re_me_id;
	private int re_rt_num;
	private String re_content;
	private Date re_regDate;
	private Date re_upDate;
	private int re_report;
	private int re_recommend;
	private float re_totalSc;
	private int re_service;
	private int re_mood;
	private int re_tasty;
	private int re_quantity;
	private int re_clean;
	
	public String getRp_regDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(re_regDate);
	}
	public String getRp_upDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(re_upDate);
	}
}
