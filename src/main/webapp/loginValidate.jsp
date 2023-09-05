<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="header.jsp"%>
<%
    String username = "";
    String password = "";
    if(request.getParameter("username")!=null){
        username = request.getParameter("username");
    }
    if(request.getParameter("password")!=null){
        password = request.getParameter("password");
    }
    String dbUrl = "jdbc:mysql://localhost:3306/trail_02";
    String dbUsername = "root";
    String dbPassword = "konaseema@68";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    String getPasswordQuery = "SELECT password FROM User WHERE username='"+username+"'";
    Statement st = connection.createStatement();
    ResultSet res = st.executeQuery(getPasswordQuery);
    res.next();
    String passwordValidate = res.getString("password");
    if(passwordValidate.equals(password)){
        Cookie cookie = new Cookie("username",username);
        cookie.setMaxAge(3600);
        response.addCookie(cookie);
        %>You are logged in successfully<%
        response.sendRedirect("dashboard.jsp");
    }
    else{
        %>Invalid username or password<%
    }
%>