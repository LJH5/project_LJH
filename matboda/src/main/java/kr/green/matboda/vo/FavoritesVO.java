package kr.green.matboda.vo;

import lombok.*;

@Data
@NoArgsConstructor // 기본생성자 추가
public class FavoritesVO {
	private int fa_num;
	private String fa_me_id;
	private int fa_rt_num;
	private int fa_state;
	
}
