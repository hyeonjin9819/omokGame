package games;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.UsersVO;




@WebServlet("/game/*")
public class GamesController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		gamehandler(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		gamehandler(request, response);
	}

	protected void gamehandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getPathInfo().trim();
		
		System.out.println(path);
		
		
		if(path.equals("/gamepage.do")) {
			HttpSession sess = request.getSession(); 
			
			
			UsersVO vo = new UsersVO();
			System.out.println("gamecall");
	
			try {
				String mapvalst = (String)sess.getAttribute("map");
				Integer mapval = Integer.parseInt(mapvalst);
				String modevalst = (String)sess.getAttribute("mode");
				Integer modeval = Integer.parseInt(modevalst);
				System.out.println(mapval + "//" + modeval);
		

				
				String pathhead = "/omokGame/view/game/boardview/omok" + mapval +"" + modeval;
				String pathtale = ".jsp";
				
				
				request.setAttribute("modeval", modeval);
				
				
				response.sendRedirect(pathhead + pathtale + "?" +"modeval=" +modeval);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("exe");
				response.sendRedirect("/omokGame/users/start");
			
				// TODO: handle exception
			}

			
		}

		
		else if (path.equals("/mode.do")) {
			
		String modeval = request.getParameter("modeval");
		
		HttpSession sess = request.getSession();
		sess.setAttribute("mode", modeval);
		System.out.println("modeval : " + modeval);
		
		
		response.sendRedirect("/omokGame/view/game/boardview/map.jsp");
	
		}

		else if (path.equals("/modepage.do")) {

			response.sendRedirect("/omokGame/view/game/boardview/mode.jsp");
			
			
		}
		else if (path.equals("/map.do")) {
			String	mapval = request.getParameter("mapval");
			System.out.println("mapval : " + mapval);
			HttpSession sess = request.getSession();
			sess.setAttribute("map", mapval);
			
			
			response.sendRedirect("/omokGame/game/gamepage.do");
			
			
		}
		
		else if (path.equals("/gameend.do")) {
			GamesDAO dao = new GamesDAO();
			GamesVO vo = new GamesVO();
			String mode = ""; // 저장될 모드 초기화
			HttpSession sess = request.getSession();
			UsersVO p1 = (UsersVO)sess.getAttribute("user1");
			UsersVO p2 = (UsersVO)sess.getAttribute("user2");
			
			System.out.println("mode 확인" + sess.getAttribute("mode"));
			if ("1".equals(sess.getAttribute("mode"))) {
				mode = "NORMAL";
			} else if("3".equals(sess.getAttribute("mode"))) {
				mode = "BLITZ";
			} else if("2".equals(sess.getAttribute("mode"))) {
				mode = "EVENT";
			}
			
			// 세션삭제
			sess.removeAttribute("mode"); 
			
			String whowin = request.getParameter("whowinsend");
			String winner =""; // 이긴 사람 pk, 초기화
			String defeat =""; // 진 사람 pk, 초기화
			
			if (whowin.equals("blackwin")) {
				//winner = p1.getId(); // pk 저장되어있으면 그 userid 가져오기
				winner = String.valueOf(p1.getUsersPK());
				vo.setWinner(winner);
				defeat = String.valueOf(p2.getUsersPK());
			} else if (whowin.equals("whitewin")) {
				//winner = p2.getId();
				winner = String.valueOf(p2.getUsersPK());
				vo.setWinner(winner);
				defeat = String.valueOf(p1.getUsersPK());
				
			}
			Date from = new Date();
		
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String to = transFormat.format(from);
			
			
	
			vo.setDate(to);
			vo.setMode(mode);
			vo.setP1Name(String.valueOf(p1.getUsersPK())); // name -> pk
			vo.setP2Name(String.valueOf(p2.getUsersPK())); // name -> pk
			
			dao.insertrst(vo);
			dao.winUpdate(Integer.parseInt(winner)); // 승리한 user 정보 업데이트
			dao.defeatUpdate(Integer.parseInt(defeat)); // 패배한 user 정보 업데이트
			
		} else if(path.equals("/resetGame.do")) {
			HttpSession sess = request.getSession();
	        sess.removeAttribute("mode");
	        response.sendRedirect("/omokGame/main.do");
		}

	}

}
