	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	    <%@ page import="com.model.EmpData" %>
	    <%@ page import="java.util.*" %>
	    <%@ page import="java.sql.*" %>
	    <%@ page import="com.controler.EmpControler" %>
	    
	    
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Employee Registration</title>
		<style>
			body {
			    font-family: "Arial", sans-serif;
			    background-color: #f0f0f0;
			    margin: 0;
			    padding: 0;
			}
			
			.reg{
			  background-color: #fff;
			  border-radius: 8px;
			  border-right: #151414;
			  padding: 20px;
			  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			  flex: 1 1 400px;
			  position: relative;
			  top: 10px;
			  right:0%;
			  left: 10px;
			}
			
			.reg h3 {
			  font-size: 24px;
			  margin-bottom: 20px;
			  color: #007bff; 
			}
			
			 label {
			  display: block;
			  margin-bottom: 8px;
			  
			}
			
			.input{

       		 width: 30%;
			  padding: 12px;
			  border: 1px solid #151414;
			  border-radius: 6px;
			  margin-bottom: 20px;
        }
			
			.submit {
			  background-color: #007bff;
			  color: #eaecf1;
			  padding: 10px 20px; 
			  font-size: 20px; 
			  border: none;
			  border-radius: 6px;
			  cursor: pointer;
			  transition: background-color 0.2s;
			  position: relative;
			  right:0%;
			  left: 160px;
			  bottom: 20px;
			
			}
			
			.submit:hover {
			  background-color: #eef3ed;
			  color: black;
			}
			
			.table {
			    width: 100%;
			    border-collapse: collapse;
			    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			    display: block;
				
			    white-space: nowrap;
			    margin-top: 30px;
				table-layout: fixed;
				
			}
			.display{
				 position:absolute; 
			    left:720px; top:20px;
				
			}
			td{
				 padding: 12px;
			    border: 1px solid #3ba912;
			    text-align: center;
			    font-weight: normal;
			    color: #000000;
				overflow: hidden;
				 background-color: #ffffff;
			    font-weight: bold;
				table-layout: fixed;
			
			}
			 th {
			    padding: 12px;
			    border: 1px solid #0e0f0e;
			    text-align: center;
			    font-weight: normal;
			    color: #000000;
				overflow: hidden;
				 background-color: #007bff;
			    font-weight: bold;
			}
			
			.table tr:nth-child(even) {
			    background-color: #f9f9f9;
			}
			
			.table.tr:hover {
			    background-color: #f0f0f0;
			}
			
			.table a {
			    display: inline-block;
			    padding: 6px 10px;
			    text-decoration: none;
				background-color: #44ec2a;
			    color: #fff;
			    border-radius: 5px;
			    transition: background-color 0.3s;
			}
			
			.table a.delete-link {
			    background-color: #ea2323;
			}
			
			.table a:hover {
			    background-color: #f9fafa;
				color: black;
			}
		</style>
	</head>
	<body>
		<div name="register" class="reg"  >
	<h3><leble>Employee Form</leble></h3>
			<form action="emp" method="post" class="form">
				<label>Employee ID: </label><input class="input" type="text" name="empid" required>
				<br><br>
				<label>Employee Name</label><input class="input" type="text" name="empname" required>
				<br><br>
				<label>Employee Address</label><input class="input" type="text" name="empadrs" required>
				<br><br>
				<label>Employee Age</label><input class="input" type="text" name="empage" required>
				<br><br>
				<input type="submit" name="submit" class="submit">
			</form>
		</div>
		<br><br>
		<div  class="display">
			<h3><label>Employee Table</label></h3> <a class="search" href="search.jsp">Search By ID</a>
			<table  class="table" style="table-layout: fixed;">
				<th>Employee ID</th>
				<th>Name</th>
				<th>Address</th>
				<th>Age</th>
				<tr>
					<% 
						String url ="jdbc:mysql://localhost:3306/jdbc_servlet";
						String user="root";
						String pass="root";
						String sql="SELECT * FROM emp";
							Connection con =DriverManager.getConnection(url, user, pass);
							Statement st=con.createStatement();
							ResultSet rs= st.executeQuery(sql);
							while(rs.next()) {
							int id=rs.getInt("idemp");
					%>
					<td><%= rs.getInt("idemp")%></td>
					<td><%= rs.getString("empname")%></td>
					<td><%= rs.getString("address")%></td>
					<td><%= rs.getInt("age")%></td>
					<td><a  href="update.jsp?id=<%=id%>">Edit</a></td>
					<td><a class="delete-link" href="delete.jsp?id=<%=id%>">Delete</a></td>
				</tr>
					<%
						}
					%>
			</table>
		</div>
	</body>
	</html>