package com.controler;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.EmpData;
@WebServlet("/update")
public class UpdateControler extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) {
		String uempid=req.getParameter("uempid");
		String uempname=req.getParameter("uempname");
		String uempadrs=req.getParameter("uempadrs");
		String uempage=req.getParameter("uempage");
		
		
		EmpData.update(uempid, uempname, uempadrs, uempage);
		System.out.println("updated");
		try {
			resp.sendRedirect("index.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
		
}
}