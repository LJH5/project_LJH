package kr.green.matboda.vo;

import lombok.Data;

@Data
public class ImageVO {
	private int im_num;
	private String im_type;
	private String im_where;
	private String im_name;
	private String im_thumbnail;
	
	public ImageVO() {}
	public ImageVO(String im_type, String im_where, String im_name) {
		this.im_type = im_type;
		this.im_where = im_where;
		this.im_name = im_name;
	}
	
}
