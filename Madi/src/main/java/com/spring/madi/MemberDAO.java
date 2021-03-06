package com.spring.madi;

import java.util.ArrayList;
import java.util.List;

public interface MemberDAO {
	//(진산) 로그인한 아이디 자신에 대한 member정보
	MemberVO getMember(String user_id);
	//(진산) 임시--MemberFollow에서 팔로잉한 사람 불러오기
	//MemberFollowVO getFollowing_user_id(String user_id);
	//(진산)팔로워 수 카운트
	ArrayList<MemberVO> getFollower(String user_id);	
	//(진산)팔로잉 수 카운트
	ArrayList<MemberVO> getFollowing(String user_id);
	//(진산)팔로워 추천 리스트
	ArrayList<MemberVO> getRecommendFollower(String user_id);
	//(진산) 추천 리스트 새로고침
	ArrayList<MemberFollowVO> getReloadRecommend();
	//(진산)팔로잉 한 명 삭제
	void deleteFollowing(String following_user_id, String user_id);
	//(진산)팔로워 한 명 삭제
	void deleteFollower(String user_id, String following_user_id);
	
	int checkUserId(String user_id);
	

	
	
	//(인욱) 카카오 아이디 DB에서 불러옴
	public MemberVO checkMember(MemberVO memberVO);
	//(인욱) 카카오 로그인시 간편회원가입(insert 메소드)
	public void set_Member(MemberVO memberVO);
	//(인욱) 카카오 중복이메일 체크
	public int checkEmail(MemberVO memberVO);
	//(진산)팔로잉 한 명 추가
	void insertFollowing(String user_id, String following_user_id, String user_img, String following_user_img);

	//성빈 : 로그인 체크를 위한 password 조회 메소드
	public MemberVO getPasswordByUserId(MemberVO memberVO);
	// 성빈 : 회원가입 메소드 (입력된 회원정보를 member 테이블에 insert한다)
	public void setMember(MemberVO memberVO);
	// 성빈 : Member_Box 테이블에서 내 재료 목록을 불러오기 위한 조회 메소드
	public ArrayList<MemberBoxVO> getMyIrdntByUserId(String user_id);
	//(진산) 재료가 중복인지 확인하기
	public MemberBoxVO getCheckIrdnt(MemberBoxVO memberBoxVO);
	//(진산) 냉장고에 재료 입력하기
	public void insertIrdnt(MemberBoxVO memberBoxVO);
	//(진산) 냉장고 재료가 중복이라 삭제하기
	public void deleteIrdnt(MemberBoxVO memberBoxVO);

	// 성빈 : 회원  기본 정보 조회 쿼리 (사용안한 메소드, 필요할까봐)

	


	public MemberVO getUserInfoById(String user_id);
	// 성빈 : following 추가
	public void setFollowing(MemberFollowVO memberFollowVO);
	// 성빈 : follwing 체크
	public int checkFollowing(MemberFollowVO memberFollowVO);
	
	// 예진: 회원 정보수정
	public int updateInfo(MemberVO memberVO);
	// 예진: 차단 목록 추가
	public int insertBlockMember(BlockMemberVO blockVO);
	// 예진: 차단 리스트
	public List<BlockMemberVO> getBlockMember(String user_id);
	// 예진: 차단한 id 팔로잉에서 지우기
	public void deleteBlockMember(BlockMemberVO blockVO);
	// 예진: 임시 비밀번호 부여
	public void tempPassword(String tempPassword, String user_email);
	// 예진: 이메일 존재 여부
	public int existEmail(String userEmail);
	
	public ArrayList<MemberVO> getRecommendByFollowerCnt(String user_id);
	public ArrayList<MemberVO> getRecommendByRecipeCnt();
	public ArrayList<MemberVO> getRecommendByLikeCnt();

}
