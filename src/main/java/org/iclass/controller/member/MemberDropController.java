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

public class MemberDropController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = ((DemoMember)session.getAttribute("user")).getUserid();
		
		DemoMemberDao dao = DemoMemberDao.getInstance();
		dao.drop(id);
		session.invalidate();		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/drop.jsp");
		dispatcher.forward(request, response);
	}

}
