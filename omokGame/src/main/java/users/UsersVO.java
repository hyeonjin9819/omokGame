package users;

import lombok.Data;

@Data
public class UsersVO {
	private int users_id;
	private String id;
	private String pwd;
	private String nickname;
	private int wincnt;
	private int gamecnt;
	private int point;
	
}
