<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Bookings</title>
<style>
    .nav-link {
        margin-right: 15px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .status-confirmed {
        color: green;
    }
    .status-cancelled {
        color: red;
    }
</style>
</head>
<body>
    <h2>Hotel Bookings</h2>
    <a href="/hotel_home/${husername}" class="nav-link">Back to Dashboard</a>
    <a href="/logout" class="nav-link">Logout</a><br><br>
    
    <table>
        <tr>
            <th>Booking ID</th>
            <th>Hotel</th>
            <th>Room</th>
            <th>Customer</th>
            <th>Check-in Date</th>
            <th>Check-out Date</th>
            <th>Total Price</th>
            <th>Status</th>
        </tr>
        <c:forEach var="booking" items="${bookings}">
        <tr>
            <td>${booking.booking_id}</td>
            <td>${booking.hotel.hname}</td>
            <td>${booking.room.room_name} (${booking.room.room_type})</td>
            <td>${booking.customer.cusername} (${booking.customer.cemail})</td>
            <td>${booking.fromDate}</td>
            <td>${booking.to_date}</td>
            <td>${booking.price}</td>
            <td class="status-${booking.status}">${booking.status}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>