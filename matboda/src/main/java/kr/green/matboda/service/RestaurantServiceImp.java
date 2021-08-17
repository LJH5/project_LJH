package kr.green.matboda.service;

import org.springframework.stereotype.Service;

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

}