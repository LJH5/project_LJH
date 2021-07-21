package kr.green.spring.vo;

import lombok.*;

@Data
@NoArgsConstructor // 기본생성자 추가
public class RecommendVO {
	private int num;
	private int board;
	private int state;
	private String id;
}
