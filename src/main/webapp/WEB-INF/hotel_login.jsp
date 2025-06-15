<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hotel_login</title>
</head>
<body>

	<h2>Login here</h2>
	<form action="hotel_login" method="post">
		enter username:
		<input type="text" name="husername"><br>
		enter password:
		<input type="password" name="hpassword"><br>
		<input type="submit" value="login">
	</form><br><br>
	
	
	<h2>Signup here</h2>
	<form action="hotel_signup" method="post">
		enter username:
		<input type="text" name="husername"><br>
		enter email:
		<input type="email" name="hemail"><br>
		enter password:
		<input type="password" name="hpassword"><br>
		<input type="submit" value="signup">
	</form>
	
	
</body>
</html>