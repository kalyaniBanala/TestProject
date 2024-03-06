package com.controler;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.*;

@WebServlet("/emp")
public class EmpControler extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) {
		int sempid=Integer.parseInt(req.getParameter("empid"));
		String sempname=req.getParameter("empname");
		String sempadrs=req.getParameter("empadrs");
		int sempage=Integer.parseInt(req.getParameter("empage"));
		
		
		EmpData.insertdata(sempid, sempname, sempadrs, sempage);
		System.out.println("data Added");
		try {
			resp.sendRedirect("index.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	
		
	}
	
		
		
		
		
	}