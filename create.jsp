<%@ page import="java.sql.*" %>
<%!
 PreparedStatement pram = null;
%>
<%  String title=request.getParameter("title");
	String publication=request.getParameter("publication");
	String author=request.getParameter("author");
	String price=request.getParameter("price");
	try
	{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","cse");
	 
	 Statement stmt = con.createStatement();
	 
	 int res = stmt.executeUpdate("create table bookstore(title varchar(20),publication varchar(20),author varchar(20),price number)");
	 
	 if(res >= 0){
	   out.println("Done");
	 }
	}
	catch(Exception e)
	{
	 out.println(e.getMessage());
	}
%>
	 