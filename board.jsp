<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>게시판</h1>
        <hr>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <form action="board.jsp" method="post">
                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea class="form-control" id="content" name="content" rows="5"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">게시</button>
                </form>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h2>게시물 목록</h2>
                <ul class="list-group">
                    <% 
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            String url = "jdbc:mysql://LeeGilWoo.mysql.pythonanywhere-services.com/LeeGilWoo$comments";
                            String username = "LeeGilWoo";
                            String password = "suny10**";

                            Connection conn = DriverManager.getConnection(url, username, password);
                            Statement statement = conn.createStatement();
                            String sql = "SELECT * FROM comments";
                            ResultSet rs = statement.executeQuery(sql);

                            while(rs.next()) {
                                String content = rs.getString("content");
                    %>
                                <li class="list-group-item"><%= content %></li>
                    <%
                            }
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
