<%@page import="java.sql.*"%> 
<% 
String fname=request.getParameter("t1"); 
String lname=request.getParameter("t2"); 
String username=request.getParameter("t21"); 
String password=request.getParameter("t3");
String phone= request.getParameter("t4");
String email= request.getParameter("t5");
String address= request.getParameter("t6");
try 
{ 
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","cse"); 
Statement stmt = conn.createStatement(); 
int i1=stmt.executeUpdate("insert into etion values('"+fname+"','"+lname+"','"+username+"','"+password+"','"+email+"','"+phone+"','"+address+"')"); 
out.println("Data is successfully registred!"); 
}
catch(Exception e) 
{ 
out.println(e); 
e.printStackTrace(); 
} 
%> 