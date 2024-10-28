<%@page import="java.sql.*"%> 
<% 
try 
{ 
String uname=request.getParameter("t"); 
String pwd=request.getParameter("p"); 
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","cse"); 
out.println("database connected success");
Statement stmt=con.createStatement(); 
ResultSet rs=stmt.executeQuery("select * from customers"); 
while(rs.next()) 
{ 
    String uname1=rs.getString("username"); 
    String pwd1=rs.getString("password"); 
    if((uname1).equals(uname));{
        if(pwd1.equals(pwd)){ 
            session.setAttribute("uname",uname); 
            response.sendRedirect("lv_welcome.jsp"); 
        } 
    }
}
}
catch(Exception e) 
{ 
out.println("exception"+e); 
} 
%> 