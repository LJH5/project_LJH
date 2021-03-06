package kr.green.matboda.service;

import java.util.ArrayList;
import java.util.Date;


import org.springframework.stereotype.Service;

import kr.green.matboda.dao.RestaurantDAO;
import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.FavoritesVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RestaurantServiceImp implements RestaurantService{

	private RestaurantDAO restaurantDao;
	private ReviewDAO reviewDao;

	@Override
	public void insertRestaurant(RestaurantVO rt, MemberVO user) {
		if(rt == null || user == null)
			return;
		rt.setRt_me_id(user.getMe_id());
		restaurantDao.insertRt(rt);
	}

	@Override
	public RestaurantVO getRt(Integer num) {
		if(num == null)
			return null;
		return restaurantDao.selectRt(num);
	}

	@Override
	public void updateRt(RestaurantVO rt, MemberVO user) {
		if(rt == null || user == null)
			return;
		RestaurantVO dbRt = restaurantDao.selectRt(rt.getRt_num());
		if(dbRt == null || !user.getMe_id().equals(dbRt.getRt_me_id()))
			return;
		dbRt.setRt_name(rt.getRt_name());
		dbRt.setRt_phoneNum(rt.getRt_phoneNum());
		dbRt.setRt_type(rt.getRt_type());
		dbRt.setRt_openTime(rt.getRt_openTime());
		Date now = new Date();
		dbRt.setRt_upDate(rt.getDate(now));
		if(rt.getRt_address() != null && rt.getRt_address().trim().length() > 3)
			dbRt.setRt_address(rt.getRt_address());
		restaurantDao.updateRt(dbRt);
	}

	@Override
	public ArrayList<RestaurantVO> getRestaurant() {
		return restaurantDao.selectRestaurant();
	}

	@Override
	public void deleteRt(Integer num, MemberVO user) {
		if(num == null || user == null)
			return;
		RestaurantVO rt = restaurantDao.selectRt(num);
		if(rt == null || (!user.getMe_authority().equals("ADMIN") && !user.getMe_authority().equals("SUPER ADMIN")))
			return;
		restaurantDao.deleteRt(num);
		reviewDao.deleteRtReview(num);
	}

	@Override
	public ArrayList<RestaurantVO> getSearchRestaurant(Criteria cri) {
		
		return restaurantDao.selectSearchRestaurant(cri);
	}

	@Override
	public int updateView(Integer num) {
		RestaurantVO rt = restaurantDao.selectRt(num);
		if(rt != null) {
			rt.setRt_view(rt.getRt_view()+1);
			restaurantDao.updateRt(rt);
		}
		return 0;
	}

	@Override
	public String updateFaverites(Integer rt_num, MemberVO user, int state) {
		if(user == null)
			return "GUEST";
		FavoritesVO fvo = restaurantDao.selectFavorites(rt_num, user.getMe_id());
		if(fvo == null) {
			restaurantDao.insertFavorites(rt_num, user.getMe_id(), state);
			return "OK";
		}
		state = state == fvo.getFa_state() ? 0 : 1;
		fvo.setFa_state(state);
		restaurantDao.updateFavorites(fvo);
		return state == 0 ? "CANCEL": (state == 1 ? "OK" : "FAIL");
	}

	@Override
	public ArrayList<RestaurantVO> getCaTop3Restaurant(String type) {
		return restaurantDao.selectCaTop3Restaurant(type);
	}

	@Override
	public void updateReCount(Integer num, int totalCount) {
		RestaurantVO rt = restaurantDao.selectRt(num);
		if(rt != null) {
			rt.setRt_reNum(totalCount);
			restaurantDao.updateRt(rt);
		}
		
	}

	@Override
	public FavoritesVO getFavority(Integer num, MemberVO user) {
		if(user == null)
			return null;
		return restaurantDao.selectFavorites(num, user.getMe_id());
	}

	@Override
	public void getFavorityCount(Integer num) {
		RestaurantVO rt = restaurantDao.selectRt(num);
		Integer fa = restaurantDao.selectFavoritesCount(num);
		if(rt != null && fa != null) {
			rt.setRt_faNum(fa);
			restaurantDao.updateRt(rt);
		}
	}

}