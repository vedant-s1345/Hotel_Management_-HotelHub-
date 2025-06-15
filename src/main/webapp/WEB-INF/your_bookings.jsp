<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Bookings</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
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
    <div style="margin-bottom: 20px;">
        <span>Welcome ${cusername}</span>
        <a href="/cust_home/${cusername}" class="nav-link">Back to Hotels</a>
        <a href="/logout" class="nav-link">Logout</a>
    </div>
    
    <h2>Your Bookings</h2>
    
    <c:choose>
        <c:when test="${empty bookings}">
            <p>You have no bookings yet.</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Hotel Name</th>
                    <th>Room Type</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.booking_id}</td>
                    <td>${booking.hotel.hname}</td>
                    <td>${booking.room.room_type.equals('ac') ? 'AC' : 'Non-AC'}</td>
                    <td>${booking.fromDate}</td>
                    <td>${booking.to_date}</td>
                    <td>₹${booking.price}</td>
                    <td class="status-${booking.status}">${booking.status}</td>
                    <td>
                        <c:if test="${booking.status == 'confirmed'}">
                            <form action="/cust_home/${cusername}/bookings/${booking.booking_id}/cancel" method="post">
                                <input type="submit" value="Cancel">
                            </form>
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>