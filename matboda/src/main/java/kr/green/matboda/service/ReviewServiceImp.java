package kr.green.matboda.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.MemberDAO;
import kr.green.matboda.dao.RestaurantDAO;
import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.utils.UploadFileUtils;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RecommendVO;
import kr.green.matboda.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private RestaurantDAO restaurantDao;
	@Autowired
	private MemberDAO memberDao;
	
	private String uploadPath = "D:\\JAVA_LJH\\img";

	@Override
	public void insertReview(ReviewVO review, MultipartFile[] imageList, MemberVO user, Criteria cri) throws Exception {
		if(user == null || review == null || review.getRe_content().length() == 0)
			return;
		review.setRe_me_nickname(user.getMe_nickname());
		review.setRe_me_id(user.getMe_id());
		reviewDao.insertReview(review);
		
		restaurantDao.updateSc(review.getRe_rt_num());
		
		if(imageList == null)
			return;
		int size = imageList.length < 5 ? imageList.length : 5;
		for(int i = 0; i<size; i++) {
			insertFile(imageList[i], "REVIEW", review.getRe_num());
		}
		
		// 유저의 총 리뷰 수
		int reviewNum = memberDao.selectReviewCountById(user, cri);
		user.setMe_reviewNum(reviewNum);
		memberDao.updateUser(user);
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Integer num, Criteria cri, MemberVO user) {
		if(num == null)
			return null;
		return reviewDao.selectReview(num, cri, user);
	}

	@Override
	public String deleteReview(Integer re_num, MemberVO user, Criteria cri) {
		if(re_num == null)
			return "FAIL";
		ReviewVO review = reviewDao.selectRe(re_num);
		if(review == null || !review.getRe_me_id().equals(user.getMe_id()))
			return "FAIL";
		reviewDao.deleteReview(re_num);
		restaurantDao.updateSc(review.getRe_rt_num());
		
		ArrayList<ImageVO> imageList = reviewDao.selectimageList(re_num);
		if(imageList != null && imageList.size() != 0) {
			for(ImageVO tmp : imageList) {
				reviewDao.deleteFile(tmp.getIm_num());
			}
		}
		// 유저의 총 리뷰 수
		int reviewNum = memberDao.selectReviewCountById(user, cri);
		user.setMe_reviewNum(reviewNum);
		memberDao.updateUser(user);
		
		return "OK";	
	}

	public boolean insertFile(MultipartFile tmp, String type, int num) throws Exception {
		if(tmp == null || tmp.getOriginalFilename().length() == 0) {
			return false;
		}
		String name = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(), tmp.getBytes());
		ImageVO image = new ImageVO(type, num, name, tmp.getOriginalFilename());
		reviewDao.insertImage(image);
		return true;
	}

	@Override
	public ReviewVO getReview(Integer num) {
		if(num == null)
			return null;
		return reviewDao.selectRe(num);
	}

	@Override
	public ArrayList<ImageVO> getimageList(Integer num) {
		if(num == null)
			return null;
		return reviewDao.selectimageList(num);
	}

	@Override
	public void getImageList(ArrayList<ReviewVO> review) {
		if(review == null || review.size() == 0)
			return;
		for(ReviewVO tmp : review) {
			tmp.setRe_image(reviewDao.selectimageList(tmp.getRe_num()));
		}
		
	}

	@Override
	public void updateReview(ReviewVO review, MemberVO user, MultipartFile[] imageList, Integer[] imageNum) throws Exception {
		if(review == null || user == null)
			return;
		ReviewVO dbReview = reviewDao.selectRe(review.getRe_num());
		if(dbReview == null || !user.getMe_id().equals(dbReview.getRe_me_id()))
			return;
		dbReview.setRe_service(review.getRe_service());
		dbReview.setRe_mood(review.getRe_mood());
		dbReview.setRe_clean(review.getRe_clean());
		dbReview.setRe_tasty(review.getRe_tasty());
		dbReview.setRe_quantity(review.getRe_quantity());
		dbReview.setRe_content(review.getRe_content());
		dbReview.setRe_totalSc(review.getRe_totalSc());
		
		reviewDao.updateReview(dbReview);
		
		ArrayList<Integer> nums = new ArrayList<Integer>();
		for(Integer tmp : imageNum) {
			nums.add(tmp);
		}
		ArrayList<ImageVO> iList = reviewDao.selectimageList(review.getRe_num());
		for(ImageVO tmp : iList) {
			if(!nums.contains((Integer)tmp.getIm_num())) {
				deleteImage(tmp);
			}
		}
		for(MultipartFile tmp : imageList) {
			insertFile(tmp, "REVIEW", review.getRe_num());
		}
	}

	private void deleteImage(ImageVO image) {
		File itmp = new File(uploadPath+image.getIm_name());
		if(itmp.exists()) {
			itmp.delete();
		}
		reviewDao.deleteFile(image.getIm_num());
	}

	@Override
	public ArrayList<ImageVO> getTopImageList(Integer num) {
		if(num == null)
			return null;
		return reviewDao.selectTopImageList(num);
	}

	@Override
	public int getTotalCount( Integer num, Criteria cri) {
		return reviewDao.selectTotalCount(num, cri);
	}

	@Override
	public String updateRecommend(Integer re_num, MemberVO user, int state) {
		if(user == null)
			return "GUEST";
		RecommendVO rvo = reviewDao.selectRecommend(re_num, user.getMe_id());
		ReviewVO review = reviewDao.selectRe(re_num);		
		
		Integer recNum = reviewDao.selectRecommendCount(re_num);
		Integer repNum = reviewDao.selectReportCount(re_num);
		
		if(recNum < 0) {
			recNum = 0;
		}
		if (repNum < 0) {
			repNum = 0;
		}
		
		//리뷰 작성자의 총 추천 수
		int recommendNum = reviewDao.selectRcommendCountById(review.getRe_me_id());
		MemberVO dbUser = memberDao.selectUser(review.getRe_me_id());
		
		
		if(rvo == null) {
			reviewDao.insertRecommend(re_num, user.getMe_id(), state);
			if(state == 1) {
				//리뷰 추천 수 +1
				review.setRe_recommend(recNum + 1);
				reviewDao.updateReview(review);
				
				//작성자 추천 수 +1
				dbUser.setMe_recommendNum(recommendNum+1);
				memberDao.updateUser(dbUser);
				return "RECOMMEND";
			}else {
				//리뷰 신고 수 + 1
				review.setRe_report(repNum + 1);
				reviewDao.updateReview(review);
				return "REPORT";
			}
		}
		state = state == rvo.getRc_state() ? 0 : state;
		rvo.setRc_state(state);
		
		reviewDao.updateRecommend(rvo);
		
		if(state == 0) {
			
			//리뷰 추천/신고 수 초기화
			review.setRe_recommend(reviewDao.selectRecommendCount(re_num));
			review.setRe_report(reviewDao.selectReportCount(re_num));
			reviewDao.updateReview(review);
			
			//리뷰 작성자 추천 수 초기화
			dbUser.setMe_recommendNum(reviewDao.selectRcommendCountById(review.getRe_me_id()));
			memberDao.updateUser(dbUser);
			
			return "CANCEL";
		}else {
			if(state == 1) {
				review.setRe_recommend(recNum + 1);
				if(repNum != 0) {
					review.setRe_report(repNum - 1);
				}
				reviewDao.updateReview(review);
				
				
				dbUser.setMe_recommendNum(reviewDao.selectRcommendCountById(review.getRe_me_id()));
				memberDao.updateUser(dbUser);
				
				return "RECOMMEND";
			}else {
				if(recNum != 0) {
					review.setRe_recommend(recNum - 1);
				}
				review.setRe_report(repNum + 1);
				reviewDao.updateReview(review);
				
		
				dbUser.setMe_recommendNum(reviewDao.selectRcommendCountById(review.getRe_me_id()));
				memberDao.updateUser(dbUser);
				
				return "REPORT";
			}
		}
		
	}

}
