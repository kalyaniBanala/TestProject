		<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1"%>
		    <%@ page import="java.sql.*" %>
		     <%!
		     	String url ="jdbc:mysql://localhost:3306/jdbc_servlet";
				String user="root";
				String pass="root";
				String sql="SELECT * FROM emp WHERE idemp=?";
		     %>
		<!DOCTYPE html>
		<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>Delete</title>
			
					<style>
			body {
			    font-family: "Arial", sans-serif;
			    background-color: #f0f0f0;
			    margin: 0;
			    padding: 0;
			}
			.input{

       		 width: 30%;
			  padding: 12px;
			  border: 1px solid #151414;
			  border-radius: 6px;
			  margin-bottom: 20px;
        	}
			.reg{
				text-align: center;
 				 border: 3px solid #f0131e;
			  background-color: #fff;
			  border-radius: 8px;
			  border-right: #151414;
			  padding: 20px;
			  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			  flex: 1 1 400px;
			  position: relative;
			  
			}
			.reg h1 {
			  font-size: 24px;
			  margin-bottom: 20px;
			  color: #f0131e; /* Header color */
			}
			
			.reg label {
			  display: block;
			  margin-bottom: 4px;
			  position: relative;
				right: 0%;
				left: 34%;
				text-align: justify;
			}
       		 .submit {
			  background-color: #f0131e;
			  color: #eaecf1;
			  padding: 10px 20px; /* Increase the padding for a bigger button */
			  font-size: 20px; /* Increase the font size for a bigger button */
			  border: none;
			  border-radius: 6px;
			  cursor: pointer;
			  transition: background-color 0.2s;
			  position: relative;
			  right:0%;
			  left: 200px;
			
			}
			
			.submit:hover {
			  background-color: #eef3ed;
			  color: black;
			}
			a{
				position: relative;
				right: 20%;
			}
			

			</style>
			
		</head>
		<body>
			<div name="register" class="reg"  align="left">
				<h1>Delete Employee</h1>
							<%
							String id=request.getParameter("id");
							Connection con =DriverManager.getConnection(url, user, pass);	
							PreparedStatement ps =con.prepareStatement(sql);
								ps =con.prepareStatement(sql);
								ps.setString(1,id);
								ResultSet rs= ps.executeQuery();
								while(rs.next()) {
							%>
			
					<form action="delete" method="post">
					
						<label>Employee ID: </label><input type="text" class="input" name="uempid" value="<%= rs.getInt("idemp") %>"  required  readonly>	
						<br><br>
						<label>Employee Name</label><input type="text" class="input" name="uempname" value="<%= rs.getString("empname")%>" required  readonly>
						<br><br>
						<label>Employee Address</label><input type="text" class="input" name="uempadrs" value="<%= rs.getString("address")%>" required  readonly>
						<br><br>
						<label>Employee Age</label><input type="text" class="input" name="uempage" value="<%= rs.getInt("age")%>" required  readonly>
						<br><br>
							
						<input type="submit" class="submit" name="submit"  value="Delete"> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<a href="index.jsp">Back</a>
					</form>
							<%
								}
							%>
							
								
							
		</body>
		</html>