package kr.green.matboda.service;

import java.util.ArrayList;

import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;

public interface RestaurantService {

	void insertRestaurant(RestaurantVO rt, MemberVO user);

	RestaurantVO getRt(Integer num);

	void updateRt(RestaurantVO rt, MemberVO user);

	ArrayList<RestaurantVO> getRestaurant();

}