package history;

import java.sql.Date;

import lombok.Data;


@Data
public class HistoryVO {
	   private int userno; 
	   private int gameIndex; 
	   private String userName;
	   private String p1Name; 
	   private String p2Name;
	   private Date date; 
	   private String winner; 
	   private int point; 
	   private double winrate; 
	   private int gamecnt; 
	   private String mode;
	   
	   private int totalPage; // 전적 테이블 페이지 처리를 위한 변수 (전체 계산) 
}
