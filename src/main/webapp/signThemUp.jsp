<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@include file="header.jsp"%>
<%
    String username = "";
    String password = "";
    String email = "";
    if(request.getParameter("username")!=null){
        username = request.getParameter("username");
    }
    if(request.getParameter("password")!=null){
        password = request.getParameter("password");
    }
    if(request.getParameter("email")!=null){
        email=request.getParameter("email");
    }
    String dbUrl = "jdbc:mysql://localhost:3306/trail_02";
    String dbUsername = "root";
    String dbPassword = "konaseema@68";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    String signupStatement = "INSERT INTO User VALUES(?,?,?)";
    PreparedStatement preparedStatement = connection.prepareStatement(signupStatement);
    preparedStatement.setString(1,username);
    preparedStatement.setString(2,password);
    preparedStatement.setString(3,email);
    preparedStatement.executeUpdate();
    response.sendRedirect("login.jsp");
%>