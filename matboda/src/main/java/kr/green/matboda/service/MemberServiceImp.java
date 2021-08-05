package kr.green.matboda.service;

import org.springframework.stereotype.Service;

import kr.green.matboda.dao.MemberDAO;

@Service
public class MemberServiceImp implements MemberService{

	MemberDAO memberDao;
	
}
