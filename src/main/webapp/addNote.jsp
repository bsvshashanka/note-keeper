<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@include file="header.jsp"%>
<%
    String username="";
    Cookie[] cookies = request.getCookies();
    for(Cookie x:cookies){
        if(x.getName().equals("username")){
            username = x.getValue();
        }
    }
    String dbUrl = "jdbc:mysql://localhost:3306/trail_02";
    String dbUsername = "root";
    String dbPassword = "konaseema@68";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    String title = "";
    String description = "";
    if(request.getParameter("title")!=null){
        title = request.getParameter("title");
        description = request.getParameter("description");
    }
    String addNote = "INSERT INTO Note (user_id,title,description) VALUES (?,?,?)";
    PreparedStatement ps=connection.prepareStatement(addNote);
    ps.setString(1,username);
    ps.setString(2,title);
    ps.setString(3,description);
    ps.executeUpdate();
    response.sendRedirect("dashboard.jsp");
%>