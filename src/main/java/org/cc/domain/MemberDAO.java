package org.cc.domain;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO vo);
	//로그인
	public MemberVO login(MemberVO vo);
	
	//회원수정
	public void updateInfo(MemberVO vo);
    
    
	
}
