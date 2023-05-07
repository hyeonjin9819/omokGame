package history;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



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
		
		String page= "";
		if("/history/index.do".equals(url)) { // 파라미터로 받을까??
			HistoryDAO dao = new HistoryDAO();
			int user = Integer.parseInt(req.getParameter("user"));
				
			HistoryVO vo = dao.getUserInfo(user); // 1은 넘겨올 유저 (pk) -> 아마 세션에 저장// 차후 변수 수정 필요 
			String filter = req.getParameter("filter");	
			
//			System.out.println("filter: "+ filter);
			
			req.setAttribute("tableList", dao.getHistoryList(user, filter)); // all은 임의로 들어간 것
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
