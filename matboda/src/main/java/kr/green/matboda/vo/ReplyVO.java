package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReplyVO {
	private int rp_num;
	private int rp_bo_num;
	private String rp_me_id;
	private String rp_content;
	private Date rp_regDate;
	private Date rp_upDate;

	public String getRp_regDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(rp_regDate);
	}
	public String getRp_upDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(rp_upDate);
	}
}
