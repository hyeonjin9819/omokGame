package games;

import java.sql.Date;

import lombok.Data;


@Data
public class GamesVO {
	
	
	private int userno; //현재 로그인 중인 회원의 pk
	private int gameIndex; // 전적테이블에서 게임 idx
	private String p1Name; // 전적테이블의 player1 닉네임 AND 현재 로그인 중인 회원의 닉네
	private String p2Name; // 전적테이블의 player2 닉네임
	private String date; // 전적 테이블 게임 날짜 
	private String winner; // 전적 테이블 승률 
	private int point; // 현재 로그인 중인 회원의 보유 포인트 
	private float winrate; // 현재 로그인 중인 회원의 승률 
	private int gamecnt; // 현재 로그인 중인 회원의 전체 게임 횟수 
	private String mode; // 전적테이블의 게임 모드 

}
