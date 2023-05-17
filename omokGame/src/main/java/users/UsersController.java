package users;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/users/*")
public class UsersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	public void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getPathInfo();
		UsersDAO dao = new UsersDAO();
		
		if("/start".equals(action)) {
			request.getSession().invalidate();
			request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
			
		} else if("/check".equals(action)) {
			String cnt = (String)request.getParameter("cnt");
			String playerNum = (String)request.getParameter("num");
			String id = (String) request.getParameter("id");
			String pwd = (String) request.getParameter("pwd");
			
			UsersVO vo = dao.searchOne(playerNum, id, pwd);
			HttpSession sess = request.getSession();
			PrintWriter out = response.getWriter();
			
			
			if(vo == null) {
				out.print("false");
			} else {
				if("2".equals(cnt)) {
					UsersVO uvo = (UsersVO) sess.getAttribute("user1");
					if(id.equals(uvo.getId())) {
						out.print("dupli");
					} else {
						sess.setAttribute("user"+cnt, vo);
						out.print("true");
					}
				} else {
					sess.setAttribute("user"+cnt, vo);
					out.print("true");
				}
				
			}
			
			
		} else if("/login".equals(action)) {
			response.setContentType("text/html; charset=UTF-8");
			HttpSession sess = request.getSession();
			if(sess.getAttribute("user1") != null && sess.getAttribute("user2") != null) {	
				System.out.println("login" + sess.getAttribute("user1"));
				System.out.println("login" +sess.getAttribute("user2"));
				response.sendRedirect("/omokGame/main.do");
			} else {
				response.getWriter().print("<script>alert('모든 플레이어가 로그인하지 않았습니다.'); "
						+ "location.href = '/omokGame/users/start';</script>");
			}
		}else if ("/signUp.do".equals(action)) {
	         response.sendRedirect("/omokGame/view/signUp/signUp.jsp");
	      } else if("/insert.do".equals(action)) {

	         UsersVO vo = new UsersVO();
	         
	         vo.setId(request.getParameter("id"));
	         vo.setPwd(request.getParameter("pwd"));
	         vo.setNickname(request.getParameter("nickname"));
	         boolean check = false;
	         
	         check = dao.insert(vo.getId(), vo.getPwd(), vo.getNickname());
	         
	      } else if("/checkNickname.do".equals(action)) {
	         boolean nickname = dao.checkNickname(request.getParameter("nickname"));
	         PrintWriter out = response.getWriter();
	         
	         if(nickname) {
	            out.print("nicknameUnchk");
	         } else {
	            out.print("nicknameChk");
	         }
	         out.flush();
	         
	      } else if ("/checkId.do".equals(action)) {
	         PrintWriter out = response.getWriter();
	         
	         boolean id = dao.checkNickname(request.getParameter("id"));
	         
	         if(id) {
	            out.print("idUnchk");
	         } else {
	            out.print("idChk");
	         }
	         out.flush();

	      } else if ("/login.do".equals(action)) {
	         response.sendRedirect("/omokGame/view/login/login.jsp");
	      }
		
	}
}
