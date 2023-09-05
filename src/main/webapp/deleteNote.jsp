<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@include file="header.jsp"%>
<%
  int note_id=0;
  if(request.getParameter("note_id")!=null){
    note_id=Integer.parseInt(request.getParameter("note_id"));
  }
  String dbUrl = "jdbc:mysql://localhost:3306/trail_02";
  String dbUsername = "root";
  String dbPassword = "konaseema@68";
  Class.forName("com.mysql.jdbc.Driver");
  Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
  String deleteNoteQuery = "DELETE FROM Note WHERE note_id="+note_id;
  Statement st = connection.createStatement();
  st.execute(deleteNoteQuery);
  response.sendRedirect("dashboard.jsp");
%>