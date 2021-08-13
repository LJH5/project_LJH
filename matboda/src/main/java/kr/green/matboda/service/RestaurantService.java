package kr.green.matboda.service;

import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;

public interface RestaurantService {

	void insertRestaurant(RestaurantVO rt, MemberVO user);

}
