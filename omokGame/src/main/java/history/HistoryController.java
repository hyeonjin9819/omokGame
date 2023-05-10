package history;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import users.UsersVO;



@WebServlet("*.do") 
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HistoryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = req.getRequestURI().substring(req.getContextPath().length());
		HttpSession sess = req.getSession();
		
		//String action = req.getPathInfo();
		
		String page= "";
		if("/history/index.do".equals(url)) { // �뙆�씪誘명꽣濡� 諛쏆쓣源�??
			System.out.println("서블릿체크");
			System.out.println(sess.getAttribute("user1"));
			/*
			 * UsersVO userVO = new UsersVO(); userVO = (UsersVO)
			 * sess.getAttribute("user1");
			 */
			
			
			HistoryDAO dao = new HistoryDAO();
			int user = Integer.parseInt(req.getParameter("user"));
			System.out.println(1);	
			HistoryVO vo = dao.getUserInfo(user); // 1�� �꽆寃⑥삱 �쑀�� (pk) -> �븘留� �꽭�뀡�뿉 ���옣// 李⑦썑 蹂��닔 �닔�젙 �븘�슂 			
			
			//String filter = req.getParameter("filter");	
			String filter = "all";
			
//			System.out.println("filter: "+ filter);
			
			req.setAttribute("tableList", dao.getHistoryList(user, filter)); // all�� �엫�쓽濡� �뱾�뼱媛� 寃�
			req.setAttribute("data", vo);
					
			page = "/WEB-INF/view/history/history.jsp";
		}
		
		
		if (page.startsWith("redirect:")) {
			res.sendRedirect(page.substring(9));
		} else {
			req.getRequestDispatcher(page).forward(req, res);
		}
			
	}
	

}
