package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.RestaurantVO;
import kr.green.matboda.vo.ReviewVO;

public interface RestaurantDAO {

	void insertRt(RestaurantVO rt);

	RestaurantVO selectRt(Integer num);

	void updateRt(RestaurantVO dbRt);

	ArrayList<RestaurantVO> selectRestaurant();

	void deleteRt(Integer num);

	void updateSc(int re_rt_num);

	ArrayList<RestaurantVO> selectSearchRestaurant(Criteria cri);

}
