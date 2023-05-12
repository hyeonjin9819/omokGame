package users;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/users/*")
public class UsersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	public void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String action = null;
		String action = request.getPathInfo();
		System.out.println(action);
		if ("/signUp.do".equals(action)) {
			response.sendRedirect("/omokGame/view/signUp/signUp.jsp");
		} else if("/insert.do".equals(action)) {
			
			UsersDAO dao = new UsersDAO();
			UsersVO vo = new UsersVO();
			
			vo.setId(request.getParameter("id"));
			vo.setPwd(request.getParameter("pwd"));
			vo.setNickname(request.getParameter("nickname"));
			boolean check = false;
			
			check = dao.insert(vo.getId(), vo.getPwd(), vo.getNickname());
			
		} else if("/checkNickname.do".equals(action)) {
			UsersDAO dao = new UsersDAO();
			boolean nickname = dao.checkNickname(request.getParameter("nickname"));
			PrintWriter out = response.getWriter();
			
			if(nickname) {
				out.print("nicknameUnchk");
			} else {
				out.print("nicknameChk");
			}
			out.flush();
			
		} else if ("/checkId.do".equals(action)) {
			UsersDAO dao = new UsersDAO();
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