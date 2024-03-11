package org.iclass.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.DemoMemberDao;
import org.iclass.vo.DemoMember;

// new RequestKeyValue("/join", "GET") 
public class MemberModifyController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//View 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/modify.jsp");
		dispatcher.forward(request, response);

	}

}
