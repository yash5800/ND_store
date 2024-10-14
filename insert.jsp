<%@ page import="java.sql.*" %>
<%!
 PreparedStatement pram = null;
%>
<%  String title=request.getParameter("title");
	String publication=request.getParameter("publication");
	String author=request.getParameter("author");
	int price=Integer.valueOf(request.getParameter("price"));
	try
	{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","cse");
	 pram = con.prepareStatement("insert into bookstore(title, publication,author, price) values(?,?,?,?)");
	 pram.setString(1,title);
	 pram.setString(2,publication);
	 pram.setString(3,author);
	 pram.setInt(4,price);
	 pram.executeUpdate();
	 
	 out.println("Done");
	}
	catch(Exception e)
	{
	 out.println(e);
	}
%>
	 