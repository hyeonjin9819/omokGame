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
	   private String date; 
	   private String winner; 
	   private int point; 
	   private double winrate; 
	   private int gamecnt; 
	   private String mode;
	   
	   private int totalPage; // ���� ���̺� ������ ó���� ���� ���� (��ü ���) 
}
