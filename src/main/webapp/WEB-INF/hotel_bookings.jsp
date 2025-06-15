<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Bookings | HotelHub</title>
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
            margin: 2rem auto;
            padding: 0 2rem;
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
        
        /* Bookings Table */
        .bookings-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .bookings-table thead th {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 1rem 1.5rem;
            text-align: left;
            font-weight: 600;
        }
        
        .bookings-table tbody tr {
            transition: all 0.2s ease;
        }
        
        .bookings-table tbody tr:nth-child(even) {
            background-color: var(--lighter-gray);
        }
        
        .bookings-table tbody tr:hover {
            background-color: var(--light-gray);
        }
        
        .bookings-table td {
            padding: 1rem 1.5rem;
            border-bottom: 1px solid var(--light-gray);
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 500;
            text-transform: capitalize;
        }
        
        .status-confirmed {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success);
        }
        
        .status-cancelled {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }
        
        .status-pending {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--secondary);
        }
        
        .action-btn {
            padding: 0.35rem 0.75rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }
        
        .action-btn.view {
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--info);
        }
        
        .action-btn.cancel {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }
        
        .action-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .empty-state i {
            font-size: 3rem;
            color: var(--gray);
            margin-bottom: 1rem;
        }
        
        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: var(--dark);
        }
        
        .empty-state p {
            color: var(--gray);
            margin-bottom: 1.5rem;
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
            .bookings-table {
                display: block;
                overflow-x: auto;
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
            <a href="/hotel_home/${husername}"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="/hotel_home/${husername}/bookings" class="active"><i class="fas fa-calendar-alt"></i> Bookings</a>
            <a href="#"><i class="fas fa-chart-bar"></i> Reports</a>
        </div>
        <div class="user-welcome">
            <span><i class="fas fa-user-circle"></i> ${husername}</span>
            <a href="/logout" class="btn btn-outline"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="dashboard-title">
                <h1><i class="fas fa-calendar-alt"></i> Hotel Bookings</h1>
                <p>Manage all your hotel reservations and guest information</p>
            </div>
            <div class="dashboard-actions">
                <button class="btn btn-primary">
                    <i class="fas fa-download"></i> Export
                </button>
            </div>
        </div>

        <!-- Bookings Table -->
        <c:choose>
            <c:when test="${not empty bookings}">
                <table class="bookings-table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Hotel</th>
                            <th>Room</th>
                            <th>Customer</th>
                            <th>Check-in</th>
                            <th>Check-out</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>#${booking.booking_id}</td>
                            <td>${booking.hotel.hname}</td>
                            <td>
                                ${booking.room.room_name}<br>
                                <small>${booking.room.room_type}</small>
                            </td>
                            <td>
                                <strong>${booking.customer.cusername}</strong><br>
                                <small>${booking.customer.cemail}</small>
                            </td>
                            <td>${booking.fromDate}</td>
                            <td>${booking.to_date}</td>
                            <td>₹${booking.price}</td>
                            <td>
                                <span class="status-badge status-${booking.status}">
                                    ${booking.status}
                                </span>
                            </td>
                            <td>
                                <button class="action-btn view">
                                    <i class="fas fa-eye"></i> View
                                </button>
                                <c:if test="${booking.status != 'cancelled'}">
                                <button class="action-btn cancel">
                                    <i class="fas fa-times"></i> Cancel
                                </button>
                                </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-calendar-times"></i>
                    <h3>No Bookings Found</h3>
                    <p>You don't have any bookings yet. All new bookings will appear here.</p>
                    <a href="/hotel_home/${husername}" class="btn btn-primary">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

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
                    <li><i class="fas fa-envelope"></i> support@hotelhub.com</li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            &copy; 2023 HotelHub. All rights reserved.
        </div>
    </footer>

    <script>
        // Add animation to table rows
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('.bookings-table tbody tr');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateY(20px)';
                row.style.transition = `all 0.3s ease ${index * 0.05}s`;
                setTimeout(() => {
                    row.style.opacity = '1';
                    row.style.transform = 'translateY(0)';
                }, 100);
            });
            
            // Add click handlers for action buttons
            document.querySelectorAll('.action-btn.view').forEach(btn => {
                btn.addEventListener('click', function() {
                    // Implement view functionality
                    alert('View booking details');
                });
            });
            
            document.querySelectorAll('.action-btn.cancel').forEach(btn => {
                btn.addEventListener('click', function() {
                    if (confirm('Are you sure you want to cancel this booking?')) {
                        // Implement cancel functionality
                        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing';
                        setTimeout(() => {
                            alert('Booking cancelled successfully');
                        }, 1000);
                    }
                });
            });
        });
    </script>
</body>
</html>