package history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.UsersVO;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MainController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//참고용
		//sess.setAttribute("loginSess", vo);
		//MemberVO mvo = (MemberVO)sess.getAttribute("loginSess");
		
		String url1 = request.getRequestURI();
		System.out.println(url1);
		
		//if ("/main.do".equals(url1)) {
			HttpSession sess = request.getSession();
			HistoryDAO dao = new HistoryDAO();
			
			UsersVO uvo1 = (UsersVO) sess.getAttribute("user1");
			UsersVO uvo2 = (UsersVO) sess.getAttribute("user2");
			
			if("1".equals(uvo1.getPlayerNum())) {
				HistoryVO vo1 = dao.selectList(uvo1.getNickname()); 
				request.setAttribute("user1", vo1);
				
				HistoryVO vo2 = dao.selectList(uvo2.getNickname()); 
				request.setAttribute("user2", vo2);
			} else {
				HistoryVO vo2 = dao.selectList(uvo1.getNickname()); 
				request.setAttribute("user1", vo2);
				
				HistoryVO vo1 = dao.selectList(uvo2.getNickname()); 
				request.setAttribute("user2", vo1);
			}
			
			
			request.getRequestDispatcher("/WEB-INF/view/main/main.jsp").forward(request, response);
			
			
		//} 
//		else if ("/mini/test.do".equals(url1)) { 
//			//앞서 history.jsp에서 플레이어1이나 플레이어2를 클릭했을때 test.do로 연결되고, 
//			// 여기서, 클릭된 플레이어의 메서드를 실행하여 이 메서드의 데이터타입에 해당하는 것을 리턴받는다.
//			// 그 리턴받은것을 저장하여, 해당 jsp로 이동하게 된다.
//			// 방금 언급한 해당 jsp에서 이전버튼을 클릭하면 다시 위의 history.do로 갔다가 
//			// history.jsp로 연결된다.
//			
//			
//			request.getRequestDispatcher("/WEB-INF/history/test1.jsp").forward(request, response);
//		} else if ("/mini/start.do".equals(url1)) {
//			// 여기에서 게임시작 화면으로 넘어가는 로직이 실행된다.
//			
//		} else if ("/mini/exit.do".equals(url1)) {
//			// 여기에서 나가기 화면으로 넘어가는 로직이 실행된다.
//		}
//		
		
	}
	
}
