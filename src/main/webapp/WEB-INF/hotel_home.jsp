<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Manager Dashboard</title>
<style>
    .nav-link {
        margin-right: 15px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    .form-container {
        margin: 10px 0;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    button {
        padding: 5px 10px;
        margin: 5px;
        cursor: pointer;
    }
</style>
</head>
<body>

    login successful as a hotel manager<br>
    welcome ${husername}<br><br>
    <a href="/logout" class="nav-link">Logout</a><br>
    <a href="/hotel_home/${husername}/bookings" class="nav-link">View Bookings</a><br>
    <table border="1">
    <tr>
        <th>Hotel Name</th>
        <th>City</th>
        <th>Location</th>
        <th>No. of AC Rooms</th>
        <th>Price of AC Room/Day</th>
        <th>No. of Non-AC Rooms</th>
        <th>Price of Non-AC Room/Day</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="h" items="${hdata}">
    <tr>
        <td>${h.hname}</td>
        <td>${h.hcity}</td>
        <td>${h.hlocation}</td>
        <td>${h.no_of_ac}</td>
        <td>${h.p_ac}</td>
        <td>${h.no_of_nonac}</td>
        <td>${h.p_nac}</td>
        <td>
            <button onclick="showForm_room('${h.hdid}')">Add Room</button>
            <button onclick="showUpdateForm('${h.hdid}')">Update Hotel</button>

            <!-- Add Room Form -->
            <div id="myForm_room_${h.hdid}" class="form-container" style="display: none;">
                <form action="/hotel_login/${husername}/${h.hdid}/add_room" method="post">
                    <label for="room_name">Enter Room Name:</label><br>
                    <input type="text" id="room_name" name="room_name" required><br>
                    
                    <select name="room_type" id="room_type" required>
                        <option value="ac">AC</option>
                        <option value="nonac">Non-AC</option>
                    </select>
                    <button type="submit">Add Room</button>
                </form>
            </div>

            <!-- Update Hotel Form -->
            <div id="updateForm_${h.hdid}" class="form-container" style="display: none;">
                <form action="/hotel_login/${husername}/${h.hdid}/update_hdata" method="post">
                    <label for="hname">Hotel Name:</label><br>
                    <input type="text" id="hname_${h.hdid}" name="hname" value="${h.hname}" required><br>
                    
                    <label for="hcity">City:</label><br>
                    <input type="text" id="hcity_${h.hdid}" name="hcity" value="${h.hcity}" required><br>
                    
                    <label for="hlocation">Location:</label><br>
                    <input type="text" id="hlocation_${h.hdid}" name="hlocation" value="${h.hlocation}" required><br>
                    
                    <label for="p_ac">Price (AC Room):</label><br>
                    <input type="number" id="p_ac_${h.hdid}" name="p_ac" value="${h.p_ac}" required><br>
                    
                    <label for="p_nac">Price (Non-AC Room):</label><br>
                    <input type="number" id="p_nac_${h.hdid}" name="p_nac" value="${h.p_nac}" required><br>
                    
                    <button type="submit">Update Hotel</button>
                </form>
            </div>
        </td>
    </tr>
    </c:forEach>
    </table>
    
    <!-- Add New Hotel Form -->
    <button onclick="showForm_hdata()">Add New Hotel</button>
    <div id="myForm_hdata" class="form-container" style="display: none;">
        <form action="/hotel_login/${husername}/add_hdata" method="post">
            <label for="hname">Enter Hotel Name:</label><br>
            <input type="text" id="hname" name="hname" required><br>
            
            <label for="hcity">Enter City Name:</label><br>
            <input type="text" id="hcity" name="hcity" required><br>
            
            <label for="hlocation">Enter Hotel Location:</label><br>
            <input type="text" id="hlocation" name="hlocation" required><br>
            
            <label for="p_ac">Enter Price Per AC-room:</label><br>
            <input type="number" id="p_ac" name="p_ac" required><br>
            
            <label for="p_nac">Enter Price Per Non AC-room:</label><br>
            <input type="number" id="p_nac" name="p_nac" required><br>
            
            <button type="submit">Add Hotel</button>
        </form>
    </div>
    
    <script>
        function showForm_room(hdid) {
            var form = document.getElementById("myForm_room_"+hdid);
            form.style.display = form.style.display === "none" ? "block" : "none";
            // Hide update form when showing room form
            document.getElementById("updateForm_"+hdid).style.display = "none";
        }
        
        function showUpdateForm(hdid) {
            var form = document.getElementById("updateForm_"+hdid);
            form.style.display = form.style.display === "none" ? "block" : "none";
            // Hide room form when showing update form
            document.getElementById("myForm_room_"+hdid).style.display = "none";
        }
        
        function showForm_hdata() {
            var form = document.getElementById("myForm_hdata");
            form.style.display = form.style.display === "none" ? "block" : "none";
        }
    </script>
</body>
</html>