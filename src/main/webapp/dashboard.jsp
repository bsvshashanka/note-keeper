<%@ page import="java.sql.*" %>
<%
    String note = request.getParameter("note");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String dbUrl = "jdbc:mysql://localhost:3306/trail_02";
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
    if(email!=null) {
    String insertQuery = "INSERT INTO User VALUES (?, ?, ?)";
    PreparedStatement preparedStatement = null;
    try {
        preparedStatement = connection.prepareStatement(insertQuery);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    try {
        preparedStatement.setString(1, username);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    try {
        preparedStatement.setString(3, email);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    try {
        preparedStatement.setString(2, password);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    try {
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    response.sendRedirect("notes.jsp?username="+username);
}

else {
    String updateQuery = "SELECT password from demoTable WHERE username='" + username+"'";

    // Create and execute the SELECT query
        Statement stmt;
        try {
            stmt = connection.createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ResultSet rs;
        try {
            rs = stmt.executeQuery(updateQuery);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String passwordValidate;
        try {
            passwordValidate = rs.getString("password");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(passwordValidate.equals(password)){
        %>
You are logged in successfully!
<%
        response.sendRedirect("notes.jsp?username="+username);
    }
    else{
        %>
Invalid username or password.
<%
    }

}
%>
You don't have any notes now, Add new notes here=>
<form action="dashboard.jsp">
    <label>
        <input name="note" required>
        <input name="username" hidden="hidden" value=<%=username%>>
    </label>
    <button type="submit" name="submit-btn">Submit</button>
</form>
