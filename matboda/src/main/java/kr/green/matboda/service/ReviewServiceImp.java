package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class ReviewServiceImp implements ReviewService {
	
	private ReviewDAO reviewDao;
}
