package kr.green.matboda.service;

import java.util.ArrayList;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.FavoritesVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;

public interface RestaurantService {

	void insertRestaurant(RestaurantVO rt, MemberVO user);

	RestaurantVO getRt(Integer num);

	void updateRt(RestaurantVO rt, MemberVO user);

	ArrayList<RestaurantVO> getRestaurant();

	void deleteRt(Integer num, MemberVO user);

	ArrayList<RestaurantVO> getSearchRestaurant(Criteria cri);

	int updateView(Integer num);

	String updateFaverites(Integer rt_num, MemberVO user, int state);

	ArrayList<RestaurantVO> getCaTop3Restaurant(String type);

	void updateReCount(Integer num, int totalCount);

	FavoritesVO getFavority(Integer num, MemberVO user);

	void getFavorityCount(Integer num);

}