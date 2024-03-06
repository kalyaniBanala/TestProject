	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ page import="java.sql.*" %>
	<%
	    String url = "jdbc:mysql://localhost:3306/jdbc_servlet";
	    String user = "root";
	    String pass = "root";
	%>
	<!DOCTYPE html>
	<html>
	<head>
		    <meta charset="ISO-8859-1">
		    <title>Employee Search</title>
		    
		  <style type="text/css">
			body {
			    font-family: "Arial", sans-serif;
			    background-color: #f0f0f0;
			    margin: 0;
			    padding: 0;
			}
			
			label {
			  display: block;
			  margin-bottom: 8px;
			  font-size: 24px;
			  margin-bottom: 20px;
			  color: #007bff; /* Header color */
			}
			
			.input{

       		 width: 30%;
			  padding: 12px;
			  border: 1px solid #151414;
			  border-radius: 6px;
			  margin-bottom: 20px;
        }
			
			/* Update the submit button styles */
			.submit {
			  background-color: #007bff;
			  color: #eaecf1;
			  padding: 10px 20px; /* Increase the padding for a bigger button */
			  font-size: 20px; /* Increase the font size for a bigger button */
			  border: none;
			  border-radius: 6px;
			  cursor: pointer;
			  transition: background-color 0.2s;
			  position: relative;
			 
			
			}
			
			.submit:hover {
			  background-color: #eef3ed;
			  color: black;
			}
		  
		  
		  table {
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
			    left:400px; top:120px;
				
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
		<div class="display">
		    <form action="search.jsp" method="GET"> 
		        <label>Search Employee</label>
		        <input class="input" type="text" name="empid" required placeholder="Employee ID">
		        <input type="submit" name="submit" class="submit" value="Search">
		    </form>
			<hr>
		    
		        <label>Employee Table</label>
		        <table class="table" style="table-layout: fixed;">
		            <th>Employee ID</th>
		            <th>Name</th>
		            <th>Address</th>
		            <th>Age</th>
		            <tr>
		                <%
		                    String id = request.getParameter("empid");
		                    try {
		                        Connection con = DriverManager.getConnection(url, user, pass);
		                        String sql = "SELECT * FROM emp WHERE idemp=?";
		                        PreparedStatement ps = con.prepareStatement(sql);
		                        ps.setString(1, id);
		                        ResultSet rs = ps.executeQuery();
		                        while (rs.next()) {
		                            int sid = rs.getInt("idemp");
		                %>
		                <td><%= rs.getInt("idemp") %></td>
		                <td><%= rs.getString("empname") %></td>
		                <td><%= rs.getString("address") %></td>
		                <td><%= rs.getInt("age") %></td>
		                <td><a href="update.jsp?id=<%= sid %>">Edit</a></td>
		                <td><a class="delete-link" href="delete.jsp?id=<%= sid %>">Delete</a></td>
		            </tr>
		            <%
		                }
		                rs.close();
		                ps.close();
		                con.close();
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		            %>
		        </table>
		    </div>
	</body>
	</html>
