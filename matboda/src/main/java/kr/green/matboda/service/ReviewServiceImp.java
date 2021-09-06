package kr.green.matboda.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.RestaurantDAO;
import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.utils.UploadFileUtils;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDAO reviewDao;

	@Autowired
	private RestaurantDAO restaurantDAO;
	private String uploadPath = "D:\\JAVA_LJH\\img";

	@Override
	public void insertReview(ReviewVO review, MultipartFile[] imageList, MemberVO user) throws Exception {
		if(user == null || review == null || review.getRe_content().length() == 0)
			return;
		review.setRe_me_nickname(user.getMe_nickname());
		review.setRe_me_id(user.getMe_id());
		reviewDao.insertReview(review);
		
		restaurantDAO.updateSc(review);
		
		if(imageList == null)
			return;
		int size = imageList.length < 5 ? imageList.length : 5;
		for(int i = 0; i<size; i++) {
			insertFile(imageList[i], "REVIEW", review.getRe_num());
		}
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Integer num, Criteria cri) {
		if(num == null)
			return null;
		return reviewDao.selectReview(num, cri);
	}

	@Override
	public String deleteReview(Integer re_num, MemberVO user) {
		if(re_num == null)
			return "FAIL";
		ReviewVO review = reviewDao.selectRe(re_num);
		if(review == null || !review.getRe_me_id().equals(user.getMe_id()))
			return "FAIL";
		reviewDao.deleteReview(re_num);
		ArrayList<ImageVO> imageList = reviewDao.selectimageList(re_num);
		if(imageList != null && imageList.size() != 0) {
			for(ImageVO tmp : imageList) {
				reviewDao.deleteFile(tmp.getIm_num());
			}
		}
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
		
		reviewDao.updateReview(dbReview);
		
		ArrayList<Integer> nums = new ArrayList<Integer>();
		for(Integer tmp : imageNum) {
			nums.add(tmp);
		}
		ArrayList<ImageVO> iList = reviewDao.selectimageList(review.getRe_num());
		System.out.println(iList);
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

}
