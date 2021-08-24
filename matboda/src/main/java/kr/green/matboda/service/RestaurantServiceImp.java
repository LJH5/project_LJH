package kr.green.matboda.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.dao.RestaurantDAO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RestaurantServiceImp implements RestaurantService{

	private RestaurantDAO restaurantDao;

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

}