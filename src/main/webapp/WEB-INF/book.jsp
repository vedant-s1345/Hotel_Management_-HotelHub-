<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Room</title>
<style>
    .error { color: red; }
</style>
</head>
<body>
    <h1>Book Room at ${hdata.hname}</h1>
    <p>Welcome ${cusername}</p>
    <a href="/logout" class="nav-link">Logout</a><br>
    
    
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    
    <form action="/cust_home/${cusername}/${hdata.hdid}/processBooking" method="post">
        <h3>Select Room Type:</h3>
        <input type="radio" id="ac" name="roomType" value="ac" checked>
        <label for="ac">AC Room (₹${hdata.p_ac}/night)</label><br>
        <input type="radio" id="nonac" name="roomType" value="nonac">
        <label for="nonac">Non-AC Room (₹${hdata.p_nac}/night)</label><br><br>
        
        <label for="fromDate">Check-in Date:</label>
        <input type="date" id="fromDate" name="fromDate" required><br><br>
        
        <label for="toDate">Check-out Date:</label>
        <input type="date" id="toDate" name="toDate" required><br><br>
        
        <label for="guests">Number of Guests:</label>
        <input type="number" id="guests" name="guests" min="1" max="4" value="1" required><br><br>
        
        <input type="submit" value="Confirm Booking">
    </form>
    
    <script>
        document.getElementById('fromDate').min = new Date().toISOString().split('T')[0];
        
        document.getElementById('fromDate').addEventListener('change', function() {
            document.getElementById('toDate').min = this.value;
        });
    </script>
</body>
</html>