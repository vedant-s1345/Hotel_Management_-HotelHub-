<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cust_login</title>
</head>
<body>

	<h2>Login here</h2>
	<form action="cust_login" method="post">
		enter username:
		<input type="text" name="cusername"><br>
		enter password:
		<input type="password" name="cpassword"><br>
		<input type="submit" value="login">
	</form><br><br>
	
	
	<h2>Signup here</h2>
	<form action="cust_signup" method="post">
		enter username:
		<input type="text" name="cusername"><br>
		enter email:
		<input type="email" name="cemail"><br>
		enter password:
		<input type="password" name="cpassword"><br>
		<input type="submit" value="signup">
	</form>
	
	
</body>
</html>