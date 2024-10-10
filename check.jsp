<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JDBC</title>
</head>
<body>
  <%!
    String jdbc_url = "jdbc:mysql://localhost:3306/my_database";
    String user = "root";
    String password = "";

    Connection con = null;
    PreparedStatement parm = null;
    Statement stmt = null;
    ResultSet rs = null; 
  %>
  <%
  try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(jdbc_url,user,password);

    stmt = con.createStatement();

    stmt.executeUpdate("create table if not exists users(user varchar(30), password varchar(30));");

    parm = con.prepareStatement("select * from users where user = ? and password = ?");
    parm.setString(1,"joker");
    parm.setString(2,"admin");

    rs = parm.executeQuery();

    if (rs.next()){
      response.sendRedirect("welcome.html");
    }
  }
  catch (Exception e){
    out.println("Error :"+e.getMessage());
  }
  %>
</body>
</html>