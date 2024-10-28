<%@page import="java.sql.*,java.util.*"%> 
<% 
String  title=request.getParameter("bt"); 
String author=request.getParameter("an"); 
String publisher=request.getParameter("pd"); 
String price=request.getParameter("price"); 
try 
{ 
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","cse"); 
Statement stmt = conn.createStatement(); 
 
int i=stmt.executeUpdate("insert into bookstore values('"+title+"','"+author+"','"+publisher+"','"+price+"')"); 
out.println("Data is successfully inserted!"); 
} 
catch(Exception e) 
{ 
out.println(e); 
e.printStackTrace(); 
} 
%>