<%@page import="java.sql.*"%>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("Class will loaded");
Connection con=DriverManager.getConnection("jdbc:Oracle:thin:@localhost:1521:xe","SYSTEM","cse");
out.println("database connected");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("create table bookstore3(title varchar(30),author varchar(20),publication varchar(20),price varchar(5))");
out.println("Create table successfully");
}
catch(Exception e)
{
out.println(e);
}
%>