package users;

import lombok.Data;

@Data
public class UsersVO {
	private int usersPK;
	private String playerNum;
	private String id;
	private String nickname;
	private int wincnt;
	private int gamecnt;
	private int point;
	private String pwd;
	
	private int winrate;
	private int ranking;
	
	
	
}
