<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Room | HotelHub</title>
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
            --error: #ef4444;
            --warning: #f59e0b;
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
            padding: 0.8rem 1.5rem;
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
        
        .btn-secondary {
            background: var(--light-gray);
            color: var(--dark);
            border: 1px solid var(--gray);
        }
        
        .btn-secondary:hover {
            background: var(--light-gray);
            color: var(--darker);
        }
        
        .container {
            max-width: 900px;
            margin: 2rem auto;
            padding: 0 2rem;
            flex: 1;
        }
        
        /* Booking Header */
        .booking-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .booking-header h1 {
            font-size: 2.3rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .booking-header p {
            color: var(--gray);
            font-size: 1rem;
        }
        
        /* Booking Layout */
		.booking-layout {
		    display: flex;
		    gap: 2rem;
		    align-items: flex-start;
		}
		
		.booking-main {
		    flex: 1;
		    min-width: 0; /* Prevents flex item from overflowing */
		}
		
		
		@media (max-width: 992px) {
		    .booking-layout {
		        flex-direction: column;
		    }
		    
		}
        
        /* Booking Card */
        .booking-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }
        
        /* Hotel Info */
        .hotel-info {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--light-gray);
        }
        
        .hotel-image {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            object-fit: cover;
            margin-right: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .hotel-text h2 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        
        .hotel-text p {
            color: var(--gray);
            font-size: 0.95rem;
            margin-bottom: 0.5rem;
        }
        
        .hotel-text p i {
            margin-right: 0.5rem;
            color: var(--primary);
        }
        
        .rating {
            display: inline-flex;
            align-items: center;
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            margin-top: 0.5rem;
        }
        
        .rating i {
            margin-right: 0.3rem;
        }
        
        /* Booking Form */
        .booking-form {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }
        
        .form-section {
            margin-bottom: 1.5rem;
        }
        
        .form-section h3 {
            font-size: 1.1rem;
            margin-bottom: 1rem;
            color: var(--dark);
            display: flex;
            align-items: center;
        }
        
        .form-section h3 i {
            margin-right: 0.8rem;
            color: var(--primary);
        }
        
        .form-group {
            margin-bottom: 1.2rem;
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
        
        /* Room Type Selection */
        .room-options {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1rem;
        }
        
        .room-option {
            display: flex;
            align-items: center;
            padding: 1.2rem;
            border-radius: 8px;
            background-color: var(--lighter-gray);
            transition: all 0.3s ease;
            cursor: pointer;
            border: 1px solid transparent;
        }
        
        .room-option:hover {
            background-color: var(--light-gray);
        }
        
        .room-option.selected {
            border-color: var(--primary);
            background-color: rgba(99, 102, 241, 0.05);
        }
        
        .room-option input[type="radio"] {
            margin-right: 1.2rem;
            width: 1.2rem;
            height: 1.2rem;
            accent-color: var(--primary);
        }
        
        .room-details {
            flex: 1;
        }
        
        .room-details h4 {
            font-size: 1rem;
            margin-bottom: 0.3rem;
            display: flex;
            justify-content: space-between;
        }
        
        .room-price {
            color: var(--primary-dark);
            font-weight: 600;
        }
        
        .room-details p {
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .room-features {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }
        
        .feature-tag {
            background: rgba(99, 102, 241, 0.1);
            color: var(--primary);
            padding: 0.3rem 0.6rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        
        /* Date Picker */
        .date-picker {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }
        
        /* Guest Selector */
        .guest-selector {
            display: flex;
            align-items: center;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            overflow: hidden;
            width: fit-content;
        }
        
        .guest-btn {
            background: var(--light-gray);
            border: none;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 1.1rem;
            color: var(--dark);
        }
        
        .guest-btn:hover {
            background: var(--light-gray);
        }
        
        .guest-count {
            width: 50px;
            text-align: center;
            font-weight: 500;
        }
        
        /* Summary Card */
        .summary-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 100px;
        }
        
        .summary-card h3 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--light-gray);
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
        }
        
        .summary-item .label {
            color: var(--gray);
        }
        
        .summary-item .value {
            font-weight: 500;
        }
        
        .summary-total {
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--light-gray);
            font-weight: 600;
            font-size: 1.1rem;
            display: flex;
            justify-content: space-between;
        }
        
        /* Form Actions */
        .form-actions {
            display: flex;
            justify-content: space-between;
            gap: 1rem;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--light-gray);
        }
        
        /* Error Message */
        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }
        
        .alert-error {
            color: var(--error);
            background-color: rgba(239, 68, 68, 0.1);
        }
        
        .alert-warning {
            color: var(--warning);
            background-color: rgba(245, 158, 11, 0.1);
        }
        
        .alert i {
            margin-right: 0.8rem;
            font-size: 1.2rem;
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
            
            .hotel-info {
                flex-direction: column;
            }
            
            .hotel-image {
                width: 100%;
                height: auto;
                margin-right: 0;
                margin-bottom: 1rem;
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
            <a href="/cust_home/${cusername}"><i class="fas fa-search"></i> Find Hotels</a>
            <a href="/cust_home/${cusername}/bookings"><i class="fas fa-calendar-alt"></i> My Bookings</a>
            <a href="#"><i class="fas fa-question-circle"></i> Help</a>
        </div>
        <div class="user-welcome">
            <span><i class="fas fa-user-circle"></i> ${cusername}</span>
            <a href="/logout" class="btn btn-outline"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Booking Header -->
        <div class="booking-header">
            <h1><i class="fas fa-calendar-check"></i> Complete Your Booking</h1>
            <p>Fill in the details below to reserve your room</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <div class="booking-layout">
            <!-- Main Booking Form -->
            <div class="booking-main">
            <div class="booking-card">
                <!-- Hotel Info -->
                <div class="hotel-info">
                    <img src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" 
                         alt="${hdata.hname}" class="hotel-image">
                    <div class="hotel-text">
                        <h2>${hdata.hname}</h2>
                        <p><i class="fas fa-map-marker-alt"></i> ${hdata.hlocation}, ${hdata.hcity}</p>
                        <div class="rating">
                            <i class="fas fa-star"></i> 4.8 (124 reviews)
                        </div>
                    </div>
                </div>

                <!-- Booking Form -->
                <form action="/cust_home/${cusername}/${hdata.hdid}/processBooking" method="post" class="booking-form">
                    <!-- Room Type Selection -->
                    <div class="form-section">
                        <h3><i class="fas fa-bed"></i> Select Room Type</h3>
                        <div class="room-options">
                            <label class="room-option selected" onclick="selectRoomType('ac')">
                                <input type="radio" id="ac" name="roomType" value="ac" checked>
                                <div class="room-details">
                                    <h4>Deluxe AC Room <span class="room-price">₹${hdata.p_ac}/night</span></h4>
                                    <p>Spacious room with air conditioning and modern amenities</p>
                                    <div class="room-features">
                                        <span class="feature-tag">AC</span>
                                        <span class="feature-tag">Free WiFi</span>
                                        <span class="feature-tag">Breakfast</span>
                                    </div>
                                </div>
                            </label>
                            <label class="room-option" onclick="selectRoomType('nonac')">
                                <input type="radio" id="nonac" name="roomType" value="nonac">
                                <div class="room-details">
                                    <h4>Standard Non-AC Room <span class="room-price">₹${hdata.p_nac}/night</span></h4>
                                    <p>Comfortable room with fan and basic amenities</p>
                                    <div class="room-features">
                                        <span class="feature-tag">Fan</span>
                                        <span class="feature-tag">Free WiFi</span>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>

                    <!-- Dates Selection -->
                    <div class="form-section">
                        <h3><i class="fas fa-calendar-alt"></i> Select Dates</h3>
                        <div class="date-picker">
                            <div class="form-group">
                                <label for="fromDate">Check-in Date</label>
                                <input type="date" id="fromDate" name="fromDate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="toDate">Check-out Date</label>
                                <input type="date" id="toDate" name="toDate" class="form-control" required>
                            </div>
                        </div>
                        <div class="alert alert-warning">
                            <i class="fas fa-info-circle"></i>
                            <span>Minimum stay: 1 night. Free cancellation until 24 hours before check-in.</span>
                        </div>
                    </div>

                    <!-- Guests -->
                    <div class="form-section">
                        <h3><i class="fas fa-users"></i> Number of Guests</h3>
                        <div class="form-group">
                            <label for="guests">Adults</label>
                            <div class="guest-selector">
                                <button type="button" class="guest-btn" onclick="adjustGuests(-1)">-</button>
                                <div class="guest-count" id="guestDisplay">1</div>
                                <input type="hidden" id="guests" name="guests" value="1">
                                <button type="button" class="guest-btn" onclick="adjustGuests(1)">+</button>
                            </div>
                        </div>
                    </div>

                    <!-- Special Requests -->
                    <div class="form-section">
                        <h3><i class="fas fa-concierge-bell"></i> Special Requests (Optional)</h3>
                        <div class="form-group">
                            <textarea name="specialRequests" class="form-control" rows="3" 
                                      placeholder="Any special requirements or preferences..."></textarea>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <a href="/cust_home/${cusername}" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Back to Search
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-check-circle"></i> Confirm Booking
                        </button>
                    </div>
                </form>
            </div>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h4>HotelHub</h4>
                <p>The leading platform connecting travelers with hotels worldwide. We simplify the booking process for both parties.</p>
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
                    <li><a href="#">Destinations</a></li>
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
        // Set minimum date for check-in to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('fromDate').min = today;
        
        // Set minimum check-out date based on check-in date
        document.getElementById('fromDate').addEventListener('change', function() {
            const fromDate = this.value;
            const toDateField = document.getElementById('toDate');
            
            // Set min date for check-out
            toDateField.min = fromDate;
            
            // If current check-out date is before new check-in date, reset it
            if (toDateField.value && toDateField.value < fromDate) {
                toDateField.value = '';
            }
            
            updateSummary();
        });
        
        // Update summary when check-out date changes
        document.getElementById('toDate').addEventListener('change', updateSummary);
        
        // Room type selection
        const roomTypeRadios = document.querySelectorAll('input[name="roomType"]');
        roomTypeRadios.forEach(radio => {
            radio.addEventListener('change', function() {
                // Update selected style
                document.querySelectorAll('.radio-option').forEach(option => {
                    option.classList.remove('selected');
                });
                
                if (this.checked) {
                    const parentOption = this.closest('.radio-option');
                    if (parentOption) {
                        parentOption.classList.add('selected');
                    }
                }
                
                updateSummary();
            });
        });
        
        // Initialize selected room type
        const initialSelected = document.querySelector('input[name="roomType"]:checked');
        if (initialSelected) {
            initialSelected.closest('.radio-option').classList.add('selected');
        }
        
        // Guest counter
        const guestsInput = document.getElementById('guests');
        const decreaseBtn = document.getElementById('decrease-guests');
        const increaseBtn = document.getElementById('increase-guests');
        
        decreaseBtn.addEventListener('click', function() {
            let value = parseInt(guestsInput.value);
            if (value > 1) {
                guestsInput.value = value - 1;
                updateSummary();
            }
        });
        
        increaseBtn.addEventListener('click', function() {
            let value = parseInt(guestsInput.value);
            if (value < 4) {
                guestsInput.value = value + 1;
                updateSummary();
            }
        });
        
        // Update booking summary
        function updateSummary() {
            // Room type
            const selectedRoomType = document.querySelector('input[name="roomType"]:checked');
            const roomTypeText = selectedRoomType ? 
                (selectedRoomType.value === 'ac' ? 'AC Room' : 'Non-AC Room') : '-';
            document.getElementById('summary-room-type').textContent = roomTypeText;
            
            // Price
            const price = selectedRoomType ? 
                (selectedRoomType.value === 'ac' ? ${hdata.p_ac} : ${hdata.p_nac}) : 0;
            document.getElementById('summary-price').textContent = `₹${price}`;
            
            // Dates
            const fromDate = document.getElementById('fromDate').value;
            const toDate = document.getElementById('toDate').value;
            document.getElementById('summary-checkin').textContent = fromDate || '-';
            document.getElementById('summary-checkout').textContent = toDate || '-';
            
            // Calculate nights
            let nights = 0;
            if (fromDate && toDate) {
                nights = calculateNights(fromDate, toDate);
            }
            document.getElementById('summary-nights').textContent = nights;
            
            // Guests
            document.getElementById('summary-guests').textContent = guestsInput.value;
            
            // Calculate and display total
            const total = nights * price;
            document.getElementById('summary-total').textContent = `₹${total}`;
        }
        
        // Calculate number of nights between two dates
        function calculateNights(startDate, endDate) {
            const start = new Date(startDate);
            const end = new Date(endDate);
            const diffTime = end - start;
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
            return diffDays > 0 ? diffDays : 0;
        }
        
        // Initialize summary with default values
        function initializeSummary() {
            // Set default check-in to tomorrow
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            const tomorrowStr = tomorrow.toISOString().split('T')[0];
            document.getElementById('fromDate').value = tomorrowStr;
            
            // Set default check-out to 2 days from now
            const dayAfterTomorrow = new Date(tomorrow);
            dayAfterTomorrow.setDate(tomorrow.getDate() + 1);
            const dayAfterTomorrowStr = dayAfterTomorrow.toISOString().split('T')[0];
            document.getElementById('toDate').value = dayAfterTomorrowStr;
            document.getElementById('toDate').min = tomorrowStr;
            
            // Update summary with defaults
            updateSummary();
        }
        
        // Initialize when page loads
        document.addEventListener('DOMContentLoaded', initializeSummary);
        
        // Form validation before submission
        document.querySelector('form').addEventListener('submit', function(e) {
            const fromDate = document.getElementById('fromDate').value;
            const toDate = document.getElementById('toDate').value;
            
            if (!fromDate || !toDate) {
                e.preventDefault();
                alert('Please select both check-in and check-out dates');
                return;
            }
            
            if (new Date(toDate) <= new Date(fromDate)) {
                e.preventDefault();
                alert('Check-out date must be after check-in date');
                return;
            }
            
            // Show loading state
            const submitBtn = document.getElementById('submit-btn');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
            submitBtn.disabled = true;
        });
    </script>
</body>
</html>