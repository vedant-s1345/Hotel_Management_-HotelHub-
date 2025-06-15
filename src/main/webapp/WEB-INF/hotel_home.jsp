<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Manager Dashboard | HotelHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --primary-light: #c7d2fe;
            --secondary: #f59e0b;
            --secondary-dark: #d97706;
            --light: #f8fafc;
            --dark: #1e293b;
            --darker: #0f172a;
            --success: #10b981;
            --danger: #ef4444;
            --info: #3b82f6;
            --gray: #64748b;
            --light-gray: #e2e8f0;
            --lighter-gray: #f1f5f9;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #f1f5f9 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* Glassmorphism Navigation */
        .navbar {
            background: rgba(15, 23, 42, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .navbar-brand {
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        
        .navbar-brand i {
            font-size: 1.8rem;
            color: var(--secondary);
            margin-right: 0.8rem;
        }
        
        .navbar-brand h2 {
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            background: linear-gradient(90deg, #fff, var(--primary-light));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .navbar-links {
            display: flex;
            gap: 2rem;
        }
        
        .navbar-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 0.5rem 0;
            position: relative;
        }
        
        .navbar-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transition: width 0.3s ease;
        }
        
        .navbar-links a:hover::after {
            width: 100%;
        }
        
        .navbar-links a:hover {
            color: var(--primary-light);
        }
        
        .user-welcome {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .user-welcome span {
            color: white;
            font-weight: 500;
            background: linear-gradient(90deg, #fff, var(--primary-light));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.6rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 0.95rem;
            position: relative;
            overflow: hidden;
        }
        
        .btn i {
            margin-right: 0.5rem;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.4);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.5);
        }
        
        .btn-primary::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -60%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to right,
                rgba(255, 255, 255, 0) 0%,
                rgba(255, 255, 255, 0.1) 50%,
                rgba(255, 255, 255, 0) 100%
            );
            transform: rotate(30deg);
            transition: all 0.3s;
        }
        
        .btn-primary:hover::after {
            left: 100%;
        }
        
        .btn-outline {
            background: transparent;
            border: 2px solid var(--secondary);
            color: white;
        }
        
        .btn-outline:hover {
            background-color: var(--secondary);
            color: var(--darker);
        }
        
        .container {
            max-width: 1400px;
/*             margin: 2rem auto;
 */            padding: 0 2rem;
            flex: 1;
        }
        
        /* Dashboard Header */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
            background: white;
            padding: 1.5rem 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .dashboard-title h1 {
            font-size: 2.3rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .dashboard-title p {
            color: var(--gray);
            font-size: 1rem;
        }
        
        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }
        
        .stat-card i {
            font-size: 1.8rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }
        
        .stat-card h3 {
            font-size: 1.1rem;
            color: var(--gray);
            margin-bottom: 0.5rem;
        }
        
        .stat-card .value {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--dark);
        }
        
        /* Hotel Cards Grid */
        .hotels-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }
        
        .hotel-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.05);
            position: relative;
        }
        
        .hotel-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.2);
        }
        
        .hotel-header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 1.5rem;
            position: relative;
        }
        
        .hotel-header h3 {
            font-size: 1.4rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
        }
        
        .hotel-header h3 i {
            margin-right: 0.8rem;
            font-size: 1.2rem;
        }
        
        .hotel-location {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
            opacity: 0.9;
            margin-bottom: 0.5rem;
        }
        
        .hotel-location i {
            margin-right: 0.5rem;
        }
        
        .hotel-body {
            padding: 1.5rem;
        }
        
        .room-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .room-type {
            background: var(--lighter-gray);
            border-radius: 8px;
            padding: 1rem;
            text-align: center;
        }
        
        .room-type i {
            font-size: 1.5rem;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        
        .room-type h4 {
            font-size: 0.9rem;
            color: var(--gray);
            margin-bottom: 0.5rem;
        }
        
        .room-count {
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.3rem;
        }
        
        .room-price {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--primary-dark);
        }
        
        .hotel-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        
        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            border-radius: 6px;
            min-width: 100px;
            flex: 1;
        }
        
        .btn-success {
            background: linear-gradient(135deg, var(--success), #0d9c6e);
            color: white;
        }
        
        .btn-warning {
            background: linear-gradient(135deg, var(--secondary), var(--secondary-dark));
            color: white;
        }
        
        .btn-info {
            background: linear-gradient(135deg, var(--info), #2563eb);
            color: white;
        }
        
        /* Modal Overlay */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }
        
        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }
        
        /* Modal Content */
        .modal-content {
            background: white;
            border-radius: 12px;
            width: 90%;
            max-width: 500px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            transform: translateY(20px);
            transition: transform 0.3s ease;
            position: relative;
        }
        
        .modal-overlay.active .modal-content {
            transform: translateY(0);
        }
        
        .modal-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--light-gray);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            background: white;
            z-index: 10;
        }
        
        .modal-header h3 {
            font-size: 1.5rem;
            color: var(--primary);
            display: flex;
            align-items: center;
        }
        
        .modal-header h3 i {
            margin-right: 0.8rem;
            color: var(--secondary);
        }
        
        .close-modal {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--gray);
            transition: color 0.3s ease;
        }
        
        .close-modal:hover {
            color: var(--danger);
        }
        
        .modal-body {
            padding: 1.5rem;
        }
        
        /* Forms */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.95rem;
        }
        
        .form-control {
            width: 100%;
            padding: 0.8rem 1.2rem;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            background-color: var(--lighter-gray);
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
            background-color: white;
        }
        
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }
        
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--light-gray);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, var(--gray), #475569);
            color: white;
        }
        
        .btn-secondary:hover {
            background: linear-gradient(135deg, #475569, #334155);
        }
        
        /* Footer */
        footer {
            background: var(--darker);
            color: white;
            padding: 3rem 0;
            margin-top: 3rem;
        }
        
        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 3rem;
        }
        
        .footer-column h4 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
            color: white;
        }
        
        .footer-column h4::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background: linear-gradient(90deg, var(--secondary), var(--primary));
        }
        
        .footer-column ul {
            list-style: none;
        }
        
        .footer-column ul li {
            margin-bottom: 0.8rem;
        }
        
        .footer-column a {
            color: #e2e8f0;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .footer-column a:hover {
            color: var(--secondary);
        }
        
        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        
        .social-links a {
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            transform: translateY(-3px);
        }
        
        .copyright {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #94a3b8;
            font-size: 0.9rem;
        }
        
        /* Responsive */
        @media (max-width: 1200px) {
            .hotels-grid {
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            }
        }
        
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 1rem;
            }
            
            .navbar-links {
                margin: 1rem 0;
                gap: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .user-welcome {
                margin-top: 1rem;
                flex-direction: column;
                width: 100%;
            }
            
            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1.5rem;
            }
            
            .hotel-actions {
                flex-direction: column;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
            
            .footer-container {
                grid-template-columns: 1fr;
                gap: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Glassmorphism Navigation -->
    <nav class="navbar">
        <a href="/" class="navbar-brand">
            <i class="fas fa-hotel"></i>
            <h2>HotelHub</h2>
        </a>
        <div class="navbar-links">
            <a href="/hotel_home/${husername}/bookings"><i class="fas fa-calendar-alt"></i> Bookings</a>
            <a href="#"><i class="fas fa-chart-bar"></i> Analytics</a>
            <a href="#"><i class="fas fa-cog"></i> Settings</a>
        </div>
        <div class="user-welcome">
            <span><i class="fas fa-user-circle"></i> Welcome, ${husername}</span>
            <a href="/logout" class="btn btn-outline"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="dashboard-title">
                <h1><i class="fas fa-tachometer-alt"></i> Hotel Manager Dashboard</h1>
                <p>Manage your properties and room inventory with ease</p>
            </div>
            <button onclick="showModal('add-hotel-modal')" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add New Hotel
            </button>
        </div>

        <!-- Stats Cards -->
        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-hotel"></i>
                <h3>Total Hotels</h3>
                <div class="value">${hdata.size()}</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-bed"></i>
                <h3>Total Rooms</h3>
                <div class="value">
                    <c:set var="totalRooms" value="0" />
                    <c:forEach var="h" items="${hdata}">
                        <c:set var="totalRooms" value="${totalRooms + h.no_of_ac + h.no_of_nonac}" />
                    </c:forEach>
                    ${totalRooms}
                </div>
            </div>
            <div class="stat-card">
                <i class="fas fa-snowflake"></i>
                <h3>AC Rooms</h3>
                <div class="value">
                    <c:set var="totalAC" value="0" />
                    <c:forEach var="h" items="${hdata}">
                        <c:set var="totalAC" value="${totalAC + h.no_of_ac}" />
                    </c:forEach>
                    ${totalAC}
                </div>
            </div>
            <div class="stat-card">
                <i class="fas fa-fan"></i>
                <h3>Non-AC Rooms</h3>
                <div class="value">
                    <c:set var="totalNonAC" value="0" />
                    <c:forEach var="h" items="${hdata}">
                        <c:set var="totalNonAC" value="${totalNonAC + h.no_of_nonac}" />
                    </c:forEach>
                    ${totalNonAC}
                </div>
            </div>
        </div>

        <!-- Hotels Grid -->
        <div class="hotels-grid">
            <c:forEach var="h" items="${hdata}">
            <div class="hotel-card">
                <div class="hotel-header">
                    <h3><i class="fas fa-hotel"></i> ${h.hname}</h3>
                    <div class="hotel-location">
                        <i class="fas fa-map-marker-alt"></i> ${h.hlocation}, ${h.hcity}
                    </div>
                </div>
                
                <div class="hotel-body">
                    <div class="room-details">
                        <div class="room-type">
                            <i class="fas fa-snowflake"></i>
                            <h4>AC Rooms</h4>
                            <div class="room-count">${h.no_of_ac}</div>
                            <div class="room-price">₹${h.p_ac}/night</div>
                        </div>
                        <div class="room-type">
                            <i class="fas fa-fan"></i>
                            <h4>Non-AC Rooms</h4>
                            <div class="room-count">${h.no_of_nonac}</div>
                            <div class="room-price">₹${h.p_nac}/night</div>
                        </div>
                    </div>
                    
                    <div class="hotel-actions">
                        <button onclick="showModal('add-room-modal-${h.hdid}')" class="btn btn-success btn-sm">
                            <i class="fas fa-plus"></i> Add Room
                        </button>
                        <button onclick="showModal('update-hotel-modal-${h.hdid}')" class="btn btn-warning btn-sm">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

    <!-- Add Hotel Modal -->
    <div id="add-hotel-modal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h3><i class="fas fa-hotel"></i> Add New Hotel</h3>
                <button class="close-modal" onclick="hideModal('add-hotel-modal')">&times;</button>
            </div>
            <div class="modal-body">
                <form action="/hotel_login/${husername}/add_hdata" method="post">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="hname">Hotel Name</label>
                            <input type="text" id="hname" name="hname" class="form-control" placeholder="Grand Horizon" required>
                        </div>
                        <div class="form-group">
                            <label for="hcity">City</label>
                            <input type="text" id="hcity" name="hcity" class="form-control" placeholder="New York" required>
                        </div>
                        <div class="form-group">
                            <label for="hlocation">Location</label>
                            <input type="text" id="hlocation" name="hlocation" class="form-control" placeholder="123 Main Street" required>
                        </div>
                        <div class="form-group">
                            <label for="p_ac">Price (AC Room)</label>
                            <input type="number" id="p_ac" name="p_ac" class="form-control" placeholder="2500" required>
                        </div>
                        <div class="form-group">
                            <label for="p_nac">Price (Non-AC Room)</label>
                            <input type="number" id="p_nac" name="p_nac" class="form-control" placeholder="1800" required>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideModal('add-hotel-modal')">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Add Hotel
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Hotel Modals (Generated for each hotel) -->
    <c:forEach var="h" items="${hdata}">
    <!-- Add Room Modal -->
    <div id="add-room-modal-${h.hdid}" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h3><i class="fas fa-bed"></i> Add Room to ${h.hname}</h3>
                <button class="close-modal" onclick="hideModal('add-room-modal-${h.hdid}')">&times;</button>
            </div>
            <div class="modal-body">
                <form action="/hotel_login/${husername}/${h.hdid}/add_room" method="post">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="room_name_${h.hdid}">Room Name/Number</label>
                            <input type="text" id="room_name_${h.hdid}" name="room_name" class="form-control" placeholder="Deluxe Suite 101" required>
                        </div>
                        <div class="form-group">
                            <label for="room_type_${h.hdid}">Room Type</label>
                            <select name="room_type" id="room_type_${h.hdid}" class="form-control" required>
                                <option value="ac">AC Room</option>
                                <option value="nonac">Non-AC Room</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideModal('add-room-modal-${h.hdid}')">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Add Room
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Update Hotel Modal -->
    <div id="update-hotel-modal-${h.hdid}" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h3><i class="fas fa-edit"></i> Update ${h.hname}</h3>
                <button class="close-modal" onclick="hideModal('update-hotel-modal-${h.hdid}')">&times;</button>
            </div>
            <div class="modal-body">
                <form action="/hotel_login/${husername}/${h.hdid}/update_hdata" method="post">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="hname_${h.hdid}">Hotel Name</label>
                            <input type="text" id="hname_${h.hdid}" name="hname" value="${h.hname}" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="hcity_${h.hdid}">City</label>
                            <input type="text" id="hcity_${h.hdid}" name="hcity" value="${h.hcity}" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="hlocation_${h.hdid}">Location</label>
                            <input type="text" id="hlocation_${h.hdid}" name="hlocation" value="${h.hlocation}" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="p_ac_${h.hdid}">Price (AC Room)</label>
                            <input type="number" id="p_ac_${h.hdid}" name="p_ac" value="${h.p_ac}" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="p_nac_${h.hdid}">Price (Non-AC Room)</label>
                            <input type="number" id="p_nac_${h.hdid}" name="p_nac" value="${h.p_nac}" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideModal('update-hotel-modal-${h.hdid}')">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Update Hotel
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </c:forEach>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h4>HotelHub</h4>
                <p>The leading platform connecting hotels with guests worldwide. We simplify the booking process for both parties.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-column">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Features</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Support</h4>
                <ul>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">FAQs</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Contact Us</h4>
                <ul>
                    <li><i class="fas fa-map-marker-alt"></i> 123 Hospitality Ave, Suite 500</li>
                    <li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
                    <li><i class="fas fa-envelope"></i> info@hotelhub.com</li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            &copy; 2023 HotelHub. All rights reserved.
        </div>
    </footer>

    <script>
    // Modal show/hide functionality
	    function showModal(modalId) {
	        document.getElementById(modalId).classList.add('active');
	        document.body.style.overflow = 'hidden';
	    }
	    
	    function hideModal(modalId) {
	        document.getElementById(modalId).classList.remove('active');
	        document.body.style.overflow = '';
	    }
	    
	    // Close modal when clicking outside or on close button
	    document.addEventListener('click', function(event) {
	        const modals = document.querySelectorAll('.modal-overlay');
	        modals.forEach(modal => {
	            if (event.target === modal || event.target.classList.contains('close-modal')) {
	                hideModal(modal.id);
	            }
	        });
	    });
	    
	    // Prevent modal content from closing when clicking inside
	    document.querySelectorAll('.modal-content').forEach(content => {
	        content.addEventListener('click', function(e) {
	            e.stopPropagation();
	        });
	    });
	    
	    // Close modal with Escape key
	    document.addEventListener('keydown', function(event) {
	        if (event.key === 'Escape') {
	            document.querySelectorAll('.modal-overlay.active').forEach(modal => {
	                hideModal(modal.id);
	            });
	        }
	    });
	    
	    // Add animation to hotel cards
	    document.addEventListener('DOMContentLoaded', function() {
	        const cards = document.querySelectorAll('.hotel-card');
	        cards.forEach((card, index) => {
	            card.style.opacity = '0';
	            card.style.transform = 'translateY(20px)';
	            card.style.transition = `all 0.4s ease ${index * 0.05}s`;
	            setTimeout(() => {
	                card.style.opacity = '1';
	                card.style.transform = 'translateY(0)';
	            }, 100);
	        });
	    });
	</script>
</body>
</html>