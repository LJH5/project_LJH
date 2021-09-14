package kr.green.matboda.vo;

import lombok.*;

@Data
@NoArgsConstructor // 기본생성자 추가
public class RecommendVO {
	private int rc_num;
	private int rc_re_num;
	private String rc_me_id;
	private int rc_state;
}
