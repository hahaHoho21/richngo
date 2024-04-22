package richngo.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import richngo.member.dto.MemberInfoDto;
import richngo.member.dto.MemberLoginDto;
import richngo.service.MemberService;


@WebServlet("/login")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prePage = request.getParameter("prePage");
		request.getSession().setAttribute("prePage", prePage);
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		MemberLoginDto dto = new MemberLoginDto(email, pwd);
		System.out.println("/login doPost dto: "+ dto);

		int result = 0;
		MemberInfoDto resultInfo = service.loginGetInfo(dto);
		System.out.println(resultInfo);
		if(resultInfo != null) {
			request.getSession().setAttribute("sssLogin", resultInfo);
			result = 1;
		}
		response.getWriter().append(String.valueOf(result));
	}

}
