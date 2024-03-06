package com.model;
import java.sql.*;
import java.util.ArrayList;
public class EmpData {
	
	
	public static void insertdata(int empid, String empname, String address, int age) {
		
		String url ="jdbc:mysql://localhost:3306/jdbc_servlet";
		String user="root";
		String pass="root";
		String sql="INSERT INTO emp VALUES(?,?,?,?)";
		try {
			Connection con =DriverManager.getConnection(url, user, pass);
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setInt(1,empid);
			ps.setString(2,empname);
			ps.setString(3,address);
			ps.setInt(4,age);
			
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Insertdata method error Method Error");
		}
		
	}
	
	
	public static void update(String empid, String empname, String address, String age) {
	    String url = "jdbc:mysql://localhost:3306/jdbc_servlet";
	    String user = "root";
	    String pass = "root";
	    String usql = "UPDATE emp SET empname=?, address=?, age=? WHERE idemp=?;"; 
	    try {
	        Connection con = DriverManager.getConnection(url, user, pass);
	        PreparedStatement ps = con.prepareStatement(usql);

	        ps.setString(1, empname);
	        ps.setString(2, address);
	        ps.setString(3, age);
	        ps.setString(4, empid);
	        ps.executeUpdate();
	        ps.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Update method error");
	    }
	}


	public static void delete(String uempid) {
		
		 String url = "jdbc:mysql://localhost:3306/jdbc_servlet";
		    String user = "root";
		    String pass = "root";
		    String usql = "DELETE FROM emp WHERE idemp=?;"; 
		    try {
		        Connection con = DriverManager.getConnection(url, user, pass);
		        PreparedStatement ps = con.prepareStatement(usql);

		        ps.setString(1, uempid);
		       
		        ps.executeUpdate();
		        ps.close();
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("Update method error");
		    }
		}
	
	
	
		
	
		
		
		
		
		
		
		
	
}


