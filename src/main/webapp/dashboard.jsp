<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Vector" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@include file="header.jsp"%>
<%
    String username = "";
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
    String getNotesQuery = "SELECT note_id,title,description FROM Note WHERE user_id='"+username+"'";
    Statement statement = connection.createStatement();
    ResultSet rs = statement.executeQuery(getNotesQuery);
    Vector<Vector<String>> notes = new Vector<>();
    while(rs.next()){
        Vector<String> temp = new Vector<>();
        temp.add(rs.getString("note_id"));
        temp.add(rs.getString("title"));
        temp.add(rs.getString("description"));
        notes.add(temp);
    }
    if(notes==null){
        %>You dont have any notes, Add new notes below<%
    }
    else{
        for(Vector<String > x: notes){
            String deleteNoteUrl="deleteNote.jsp?note_id="+x.get(0);%>
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title"><%=x.get(1)%></h5>
                    <p class="card-text"><%=x.get(2)%></p>
                    <form action="deleteNote.jsp">
                        <input type="hidden" name="note_id" value=<%=x.get(0)%>>
                        <button class="btn btn-primary" type="submit">Delete</button>
                    </form>
                </div>
            </div>
<%
        }
    }
%>
<form action="addNote.jsp" class="form-floating mb-3" style="max-width: 50%">
    <div class="form-floating">
        <input name="title" type="text" class="form-control" id="floatingInput">
        <label for="floatingInput">Title</label>
    </div>
    <div class="form-floating">
        <input name="description" type="text" class="form-control" id="floatingPassword" >
        <label for="floatingPassword">Description</label>
    </div>
    <button type="submit">Add</button>
</form>