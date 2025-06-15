<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Listings</title>
<style>
    .available {
        color: green;
    }
    .unavailable {
        color: red;
    }
</style>
</head>
<body>
    welcome ${cusername}<br>
    <a href="/cust_home/${cusername}/bookings" class="nav-link">Your Bookings</a><br>
    <a href="/logout" class="nav-link">Logout</a><br>
    
    <br>
    Available Hotels:
    <br>
    <form action="/cust_home/${cusername}" method="get">
        Search by City: 
        <input type="text" name="city" value="${param.city}" />
        <input type="submit" value="Filter" />
    </form><br>
    
    <table border="1">
    <tr>
        <th>Hotel ID</th>
        <th>Hotel Name</th>
        <th>City</th>
        <th>Location</th>
        <th>AC Rooms<br>(Available/Total)</th>
        <th>Price (AC)</th>
        <th>Non-AC Rooms<br>(Available/Total)</th>
        <th>Price (Non-AC)</th>
        <th>Action</th>
    </tr>
    <c:forEach var="h" items="${hdata}">
    <tr>
        <td>${h.hdid}</td>
        <td>${h.hname}</td>
        <td>${h.hcity}</td>
        <td>${h.hlocation}</td>
        <td>
            <span class="available">${h.availableAcRooms}</span> / 
            <span>${h.no_of_ac}</span>
        </td>
        <td>${h.p_ac}</td>
        <td>
            <span class="available">${h.availableNonAcRooms}</span> / 
            <span>${h.no_of_nonac}</span>
        </td>
        <td>${h.p_nac}</td>
        <td>
        <form action="/cust_home/${cusername}/${h.hdid}" method="get">
            <input type="submit" value="book">
        </form>
        </td>
    </tr>
    </c:forEach>
    </table>
</body>
</html>