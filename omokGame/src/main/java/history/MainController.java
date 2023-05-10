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
		
		//�����
		//sess.setAttribute("loginSess", vo);
		//MemberVO mvo = (MemberVO)sess.getAttribute("loginSess");
		
		String url1 = request.getRequestURI();
		System.out.println(url1);
		
		//if ("/main.do".equals(url1)) {
			HttpSession sess = request.getSession();
			HistoryDAO dao = new HistoryDAO();
			
			UsersVO uvo1 = (UsersVO) sess.getAttribute("user1");
			UsersVO uvo2 = (UsersVO) sess.getAttribute("user2");
			
			System.out.println("0509test : " + uvo1);
			System.out.println("0509test : " + uvo2);

			
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
//			//�ռ� history.jsp���� �÷��̾�1�̳� �÷��̾�2�� Ŭ�������� test.do�� ����ǰ�, 
//			// ���⼭, Ŭ���� �÷��̾��� �޼��带 �����Ͽ� �� �޼����� ������Ÿ�Կ� �ش��ϴ� ���� ���Ϲ޴´�.
//			// �� ���Ϲ������� �����Ͽ�, �ش� jsp�� �̵��ϰ� �ȴ�.
//			// ��� ����� �ش� jsp���� ������ư�� Ŭ���ϸ� �ٽ� ���� history.do�� ���ٰ� 
//			// history.jsp�� ����ȴ�.
//			
//			
//			request.getRequestDispatcher("/WEB-INF/history/test1.jsp").forward(request, response);
//		} else if ("/mini/start.do".equals(url1)) {
//			// ���⿡�� ���ӽ��� ȭ������ �Ѿ�� ������ ����ȴ�.
//			
//		} else if ("/mini/exit.do".equals(url1)) {
//			// ���⿡�� ������ ȭ������ �Ѿ�� ������ ����ȴ�.
//		}
//		
		
	}
	
}
