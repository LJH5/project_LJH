package kr.green.matboda.dao;

import java.util.ArrayList;

import kr.green.matboda.vo.RestaurantVO;

public interface RestaurantDAO {

	void insertRt(RestaurantVO rt);

	RestaurantVO selectRt(Integer num);

	void updateRt(RestaurantVO dbRt);

	ArrayList<RestaurantVO> selectRestaurant();
}
