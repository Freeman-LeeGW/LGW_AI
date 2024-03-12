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
                <% 
                    Connection conn = null;
                    try {
                        // DB 연결
                        Class.forName("com.mysql.jdbc.Driver");
                        String url = "jdbc:mysql://223.130.143.77/test$member";
                        String username = "root";
                        String password = "suny10**";

                        conn = DriverManager.getConnection(url, username, password);
                        out.println("<h3>DB 연결 성공</h3>");
                        
                        // 게시물 목록 가져오기
                        Statement statement = conn.createStatement();
                        String sql = "SELECT * FROM comments";
                        ResultSet rs = statement.executeQuery(sql);

                        // 결과 출력
                        out.println("<ul class='list-group'>");
                        while(rs.next()) {
                            String content = rs.getString("content");
                %>
                            <li class="list-group-item"><%= content %></li>
                <%
                        }
                        out.println("</ul>");
                        
                        // 자원 해제
                        rs.close();
                        statement.close();
                    } catch(Exception e) {
                        out.println("<h3>DB 연결 실패</h3>");
                        e.printStackTrace();
                    } finally {
                        try {
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
