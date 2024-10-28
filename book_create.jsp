<%@ page import="java.sql.*" %>
<%
Connection conn = null;
Statement stmt = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "cse");
    stmt = conn.createStatement();
    out.println("Database connected successfully");
    ResultSet rs=stmt.executeQuery("create table bookstore(title varchar(30),author varchar(20),publication varchar(20),price varchar(5))");
    out.println("Table created SUCCESSFULLY ");
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
