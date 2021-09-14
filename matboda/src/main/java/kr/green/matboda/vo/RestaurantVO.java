package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class RestaurantVO {
	private int rt_num;
	private String rt_name;
	private String rt_address;
	private String rt_phoneNum;
	private String rt_type;
	private String rt_openTime;
	private String rt_menu;
	private String rt_me_id;
	private Date rt_regDate;
	private String rt_upDate;
	private float rt_score;
	private String rt_im_name; 
	private int rt_reNum;
	private int rt_view;
	
	public String getDate(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
	public String getDateTime(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(date);
	}
}