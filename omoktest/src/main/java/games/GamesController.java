package games;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
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
				
				sess.removeAttribute("mode"); 
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
			
			
			try {

				GamesDAO dao = new GamesDAO();
				GamesVO vo = new GamesVO();
				HttpSession sess = request.getSession();
				UsersVO p1 = (UsersVO)sess.getAttribute("user1");
				UsersVO p2 = (UsersVO)sess.getAttribute("user2");
				String whowin = request.getParameter("whowinsend");
				String winner;
				if (whowin.equals("blackwin")) {
					winner = p1.getId();
					vo.setWinner(winner);
					
				} else if (whowin.equals("whitewin")) {
					winner = p2.getId();
					vo.setWinner(winner);
				}
				Date from = new Date();
			
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				String to = transFormat.format(from);
		
				vo.setDate(to);
				vo.setMode("default");
				vo.setP1Name(p1.getId());
				vo.setP2Name(p2.getId());
				dao.insertrst(vo);
				
				
			} catch (Exception e) {
			
			}
	

		}

	}

}
