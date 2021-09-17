package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.FavoritesVO;
import kr.green.matboda.vo.RestaurantVO;

public interface RestaurantDAO {

	void insertRt(RestaurantVO rt);

	RestaurantVO selectRt(Integer num);

	void updateRt(RestaurantVO dbRt);

	ArrayList<RestaurantVO> selectRestaurant();

	void deleteRt(Integer num);

	void updateSc(int re_rt_num);

	ArrayList<RestaurantVO> selectSearchRestaurant(@Param("cri")Criteria cri);

	FavoritesVO selectFavorites(@Param("rt_num")Integer rt_num, @Param("me_id")String me_id);

	void insertFavorites(@Param("rt_num")Integer rt_num, @Param("me_id")String me_id, @Param("state")int state);

	void updateFavorites(@Param("fvo")FavoritesVO fvo);
}
