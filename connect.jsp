<%@page import="java.sql.*" %> 

<% 

try 

{ 

Class.forName("com.mysql.jdbc.Driver").newInstance();       

out.println("<h1>"); 

out.println("Loaded the Driver"); 

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1","root",""); 

out.println("Connect set"); 
}

catch(Exception e) 

{ 

out.println(e.toString()); 

} 

%> 