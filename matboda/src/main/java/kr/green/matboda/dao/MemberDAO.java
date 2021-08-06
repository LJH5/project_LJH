package kr.green.matboda.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO user);

	MemberVO selectUser(String id);

	void keepLogin(@Param("me_id")String me_id, @Param("me_sessionId")String me_sessionId, @Param("me_sessionLimit")Date me_sessionLimit);

	MemberVO selectUserBySeesion(String me_sessionId);

}
