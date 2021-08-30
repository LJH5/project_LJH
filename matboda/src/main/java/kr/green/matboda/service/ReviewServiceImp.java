package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.utils.UploadFileUtils;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDAO reviewDao;

	private String uploadPath = "D:\\JAVA_LJH\\img";
	
	@Override
	public void insertReview(ReviewVO review, MemberVO user, MultipartFile[] fileList) throws Exception {
		if(user == null || review == null)
			return;
		if (review.getRe_content().length() == 0 ) {
			return;
		}
		review.setRe_me_nickname(user.getMe_nickname());
		review.setRe_me_id(user.getMe_id());
		reviewDao.insertReview(review);
		
		if(fileList == null)
			return;
		int size = fileList.length < 5 ? fileList.length : 5;
		for(int i = 0; i<size; i++) {
			insertFile(fileList[i], "Review", review.getRe_num());
		}
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Integer num) {
		if(num == null)
			return null;
		return reviewDao.selectReview(num);
	}

	@Override
	public String deleteReview(Integer re_num, MemberVO user) {
		if(re_num == null)
			return "FAIL";
		ReviewVO review = reviewDao.selectRe(re_num);
		if(review == null || !review.getRe_me_id().equals(user.getMe_id()))
			return "FAIL";
		reviewDao.deleteReview(re_num);
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
}
