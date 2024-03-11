<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<body>
	<form action="register.jsp" method="post">
    <table border=1>
      <tr><td>아이디</td><td><input type="text" name="id"></td></tr>
      <tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
      <tr><td>이름</td><td><input type="text" name="name"></td></tr>
      <tr><td>폰번호</td><td><input type="text" name="phone"></td></tr>
      <tr><td>주소</td><td><input type="text" name="address"></td></tr>
	  <tr><td>성별</td><td>
		<input type='radio' name='gender' value='female' />여성
		<input type='radio' name='gender' value='male' />남성
	  </td></tr> 
	  
      <tr><td>이메일</td><td><input type="text" name="email"></td></tr>
      <tr><td colspan=2><input type="submit" value="전송"></td></tr>
    </table>
    </form>
</body>
</html>
