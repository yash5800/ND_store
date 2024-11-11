<%@page import="java.sql.*" %>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("Registered the JDBC driver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","cse");
out.println("<br>Connection Established");
Statement stmt = conn.createStatement();
out.println("<br>Statement created");
ResultSet rset = stmt.executeQuery ("SELECT * FROM bookstore3");
out.println("<table border=1 align=center font=red><tr><td>Title</td><td>Author</td><td>Publisher</td><td>Price</td></tr>");
while(rset.next())
out.println("<tr><td>"+rset.getString(1)+"</td><td>"+rset.getString(2)+"</td><td>"+rset.getString(3)+"</td><td>"+rset.getString(4)+"</td></tr>");
out.println("</table>");
}
catch (Exception e)
{
out.println(e);
e.printStackTrace();
}
%>
