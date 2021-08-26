package kr.green.matboda.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(@Param("review")ReviewVO review);

}
