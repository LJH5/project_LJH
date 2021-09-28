package kr.green.matboda.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import kr.green.matboda.vo.ReviewVO;

public interface MemberDAO {

	void insertMember(MemberVO user);

	MemberVO selectUser(String id);

	void keepLogin(@Param("me_id")String me_id, @Param("me_sessionId")String me_sessionId, @Param("me_sessionLimit")Date me_sessionLimit);

	MemberVO selectUserBySeesion(String me_sessionId);

	ArrayList<MemberVO> selectUserList(@Param("me_authority")String me_authority, @Param("cri")Criteria cri);

	int getTotalCount(@Param("me_authority")String me_authority);

	void deleteMember(String me_id);

	void updateUser(MemberVO dbUser);

	int selectReviewCountById(@Param("user")MemberVO user, @Param("cri")Criteria cri);

	int selectFavoritesCountById(@Param("user")MemberVO user, @Param("cri")Criteria cri);

	ArrayList<ReviewVO> selectReviewById(@Param("user")MemberVO user, @Param("cri")Criteria cri);

	ArrayList<RestaurantVO> selectRestaurantByFavorites(@Param("user")MemberVO user, @Param("cri")Criteria cri);

}
