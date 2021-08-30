package kr.green.matboda.vo;

import lombok.Data;

@Data
public class ImageVO {
	private int im_num;
	private String im_type;
	private int im_where;
	private String im_name;
	private String im_thumbnail;
	private String im_oriName;
	
	public ImageVO() {}
	public ImageVO(String im_type, int im_where, String im_name, String im_oriName) {
		this.im_type = im_type;
		this.im_where = im_where;
		this.im_name = im_name;
		this.im_oriName = im_oriName;
	}
	
}
