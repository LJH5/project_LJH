package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RecommendVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(@Param("review")ReviewVO review);

	ArrayList<ReviewVO> selectReview(@Param("num")Integer num, @Param("cri")Criteria cri, @Param("user")MemberVO user);

	void insertImage(ImageVO file);

	ReviewVO selectRe(Integer num);

	void deleteReview(Integer re_num);

	ArrayList<ImageVO> selectimageList(Integer num);

	void updateReview(ReviewVO dbReview);

	void deleteFile(int im_num);

	ArrayList<ImageVO> selectTopImageList(Integer num);

	int selectTotalCount(@Param("num")Integer num, @Param("cri")Criteria cri);

	RecommendVO selectRecommend(@Param("re_num")Integer re_num, @Param("me_id")String me_id);

	void insertRecommend(@Param("re_num")Integer re_num, @Param("me_id")String me_id, @Param("state")int state);

	void updateRecommend(@Param("rvo")RecommendVO rvo);

	void deleteRtReview(Integer num);

	Integer selectRecommendCount(Integer re_num);

	Integer selectReportCount(Integer re_num);

	int selectRcommendCountById(String re_me_id);
}
