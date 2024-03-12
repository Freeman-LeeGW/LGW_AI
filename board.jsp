<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP MySQL 연동 예제</title>
</head>
<body>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");
            // 데이터베이스 연결 설정
            String url = "jdbc:mysql://223.130.143.77:4096/test";
            String username = "root";
            String password = "sunyy10";
            // 데이터베이스 연결
            conn = DriverManager.getConnection(url, username, password);
            // 연결 성공 메시지 출력
            out.println("<h2>연결 성공</h2>");
            // SQL 쿼리 실행
            String sql = "SELECT * FROM member";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            // 결과 출력
            out.println("<table border='1'>");
            out.println("<tr><th>이름</th><th>나이</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getInt("age") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            // 연결 실패 메시지 출력
            out.println("<h2>연결 실패</h2>");
            e.printStackTrace();
        } finally {
            // 리소스 해제
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
