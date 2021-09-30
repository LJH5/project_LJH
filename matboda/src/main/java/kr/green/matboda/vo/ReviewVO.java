package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int re_num;
	private String re_me_id;
	private int re_rt_num;
	private String re_me_nickname;
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
	private String re_me_picture;
	ArrayList<ImageVO> re_image;
	private int re_rc_state;
	private int re_me_reviewNum;
	private int re_me_recommendNum;
	
	public String getRe_regDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(re_regDate);
	}
	public String getRe_upDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(re_upDate);
	}
}
