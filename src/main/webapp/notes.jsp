<%@ page import="java.sql.*" %>
<%@ page import="" %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" href="style/style.css">
<header>
    <%@include file="header.jsp"%>
</header>
<%
    String message = request.getParameter("message");
    String newNoteTitle = request.getParameter("newNoteTitle");
    String newNoteDescription = request.getParameter("NewNoteDescription");
    String username = request.getParameter("username");
    String dbUrl = "jdbc:mysql://localhost:3306/demo";
    String dbUsername = "root";
    String dbPassword = "konaseema@68";
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    Connection connection = null;
    try {
        connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    if(username==null){
        %>You don't have permission to view this page<%
    }
    else {
        %>Welcome<%
        Statement getNotes = null;
        try {
            getNotes = connection.createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String getNotesQuery = "SELECT title,description from Note WHERE username='" + username + "'";
        ResultSet rs;
        try {
            rs = getNotes.executeQuery(getNotesQuery);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    if(message!=null){
        %>Inside delete<%

    }
    ArrayList<ArrayList<String >> notes = new ArrayList<>();
    while(rs.next()){
        ArrayList<String> list = new ArrayList<String >();
        String title = rs.getString("title");
        String description = rs.getString("description");
        list.add(title);
        list.add(description);
        notes.add(list);
    }
        for (ArrayList<String> s : notes) {

            %>
            <div class="container" style="border: 2px solid black">
                <%=s%>
                <form action="notes.jsp" method="get">
                    <label>
                        <input name="message" hidden="hidden" value=<%=msg%>>
                    </label>
                    <label>
                        <input name="username" hidden="hidden" value=<%=username%>>
                    </label>
                    <button type="submit">Delete</button>
                </form>
            </div>
<%
            }
        }
    }
%>
<%=username%>
<form action="notes.jsp" method="post">
    <label>
        <input name="NewNoteTitle" placeholder="Title" required>
    </label>
    <label>
        <input name="newNoteDescription" placeholder="Enter a note to remember" required>
    </label>
    <label>
        <input name="username" hidden="hidden" value=<%=username%>>
    </label>
    <button type="submit">Submit</button>
</form>
Welcome to your dashboard