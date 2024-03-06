package com.controler;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.EmpData;
@WebServlet("/delete")
public class DeleteControler extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) {
		String uempid=req.getParameter("uempid");
		EmpData.delete(uempid);
		try {
			resp.sendRedirect("index.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
}
}