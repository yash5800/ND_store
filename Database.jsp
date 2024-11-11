<%@page import="java.sql.*"%>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("Class will loaded");
Connection con=DriverManager.getConnection("jdbc:Oracle:thin:@localhost:1521:xe","SYSTEM","cse");
out.println("database connected");
}
catch(Exception e)
{
out.println(e);
}
%>