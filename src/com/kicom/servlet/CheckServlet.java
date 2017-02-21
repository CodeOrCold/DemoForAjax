package com.kicom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//接收请求带过来的name值
		String name = request.getParameter("name");
		//检测name值是否可用
		if ("scott".equals(name)) {
			out.println("用户名不可用");
			System.out.println("用户比对失败");
			System.out.println("Ajax==============");
		}else {
			out.println("用户名可用");
			System.out.println("用户比对成功");
			
		}
		System.out.println(name);
		out.flush();
		out.close();
		
	}

}
