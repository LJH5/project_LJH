package kr.green.test.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.test.vo.MemberVO;

public interface MemberDAO {
	public String getEmail(@Param("id")String id);

	public MemberVO getMember(@Param("id")String id);
}
