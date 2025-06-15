<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HotelHub | Connect Hotels with Guests</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
            --secondary: #f59e0b;
            --light: #f8fafc;
            --dark: #1e293b;
            --success: #10b981;
            --danger: #ef4444;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            line-height: 1.6;
        }
        
        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.4)), 
                        url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 60vh;
            min-height: 500px;
            display: flex;
            flex-direction: column;
        }
        
        /* Navigation */
       nav {
		    background-color: rgba(255, 255, 255, 0); /* fully transparent */
		    padding: 1rem 2rem;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    position: sticky;
		    top: 0;
		    z-index: 100;
		    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* more visible shadow */
		    backdrop-filter: blur(8px); /* Optional: blur background for glass effect */
		}

        
        .nav-logo {
            display: flex;
            align-items: center;
        }
        
        .nav-logo i {
            font-size: 1.8rem;
            color: var(--secondary);
            margin-right: 0.8rem;
        }
        
        .nav-logo h2 {
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .nav-links {
            display: flex;
            gap: 2rem;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 0.5rem 0;
            position: relative;
        }
        
        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--secondary);
            transition: width 0.3s ease;
        }
        
        .nav-links a:hover::after {
            width: 100%;
        }
        
        .nav-links a:hover {
            color: var(--secondary);
        }
        
        .hero-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 2rem;
        }
        
        .hero-content h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            font-weight: 700;
        }
        
        .hero-content p {
            font-size: 1.3rem;
            max-width: 800px;
            margin-bottom: 2.5rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }
        
        /* User Type Selection */
        .user-types {
            background-color: white;
            padding: 5rem 2rem;
        }
        
        .user-types-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .section-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .section-header h2 {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }
        
        .section-header p {
            color: #64748b;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .user-cards {
            display: flex;
            justify-content: center;
            gap: 3rem;
            flex-wrap: wrap;
        }
        
        .user-card {
            background: white;
            border-radius: 12px;
            padding: 3rem;
            width: 500px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
            transition: all 0.3s ease;
            text-align: center;
            border: 1px solid #e2e8f0;
        }
        
        .user-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.5);
        }
        
        .user-icon {
            width: 50px;
            height: 50px;
            background-color: #eff6ff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: var(--primary);
            font-size: 3rem;
        }
        
        .user-card h3 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--primary);
        }
        
        .features-list {
            text-align: left;
            margin-bottom: 2.5rem;
        }
        
        .features-list li {
            margin-bottom: 0.8rem;
            display: flex;
            align-items: flex-start;
        }
        
        .features-list i {
            color: var(--success);
            margin-right: 0.8rem;
            margin-top: 0.2rem;
        }
        
        .action-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 1rem 2.5rem;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-block;
        }
        
        .action-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(37, 99, 235, 0.2);
        }
        
        /* How It Works */
        .how-it-works {
            background-color: #f8fafc;
            padding: 5rem 2rem;
        }
        
        .steps-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .step-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .step-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .step-number {
            width: 60px;
            height: 60px;
            background-color: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0 auto 1.5rem;
        }
        
        .step-card h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }
        
        /* Testimonials */
        .testimonials {
            padding: 5rem 2rem;
            background-color: white;
        }
        
        .testimonials-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        /* Footer */
        footer {
            background-color: var(--dark);
            color: white;
            padding: 4rem 0 2rem;
        }
        
        .footer-container {
            max-width: 1200px;
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
        }
        
        .footer-column h4::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background-color: var(--secondary);
        }
        
        .footer-column p {
            color: #cbd5e1;
            margin-bottom: 1rem;
        }
        
        .footer-column ul {
            list-style: none;
        }
        
        .footer-column ul li {
            margin-bottom: 0.8rem;
        }
        
        .footer-column a {
            color: #cbd5e1;
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
            background-color: #334155;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            background-color: var(--secondary);
            transform: translateY(-3px);
        }
        
        .copyright {
            text-align: center;
            padding-top: 3rem;
            margin-top: 3rem;
            border-top: 1px solid #334155;
            color: #94a3b8;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            nav {
                padding: 1rem;
            }
            
            .nav-links {
                gap: 1rem;
            }
            
            .hero-content h1 {
                font-size: 2.5rem;
            }
            
            .hero-content p {
                font-size: 1.1rem;
            }
            
            .user-card {
                width: 100%;
                padding: 2rem;
            }
            
            .section-header h2 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero">
        <nav>
            <div class="nav-logo">
                <i class="fas fa-hotel"></i>
                <h2>HotelHub</h2>
            </div>
            <div class="nav-links">
                <a href="#">Home</a>
                <a href="#how-it-works">How It Works</a>
                <a href="#contact">Contact</a>
            </div>
        </nav>
        
        <div class="hero-content">
            <h1>Connecting Hotels with Guests</h1>
            <p>The premier platform for hotel managers to showcase their properties and for travelers to find the perfect accommodation</p>
        </div>
    </section>
    
    <!-- User Type Selection -->
    <section class="user-types">
        <div class="user-types-container">
            <div class="section-header">
                <h2>Who Are You?</h2>
                <p>Select your role to get started with our platform</p>
            </div>
            
            <div class="user-cards">
                <!-- Hotel Manager Card -->
                <div class="user-card">
                    <div class="user-icon">
                        <i class="fas fa-user-tie"></i>
                    </div>
                    <h3>Hotel Manager</h3>
                    <ul class="features-list">
                        <li><i class="fas fa-check-circle"></i> Create and manage your hotel profile</li>
                        <li><i class="fas fa-check-circle"></i> Add room types (AC/Non-AC) with pricing</li>
                        <li><i class="fas fa-check-circle"></i> Update availability in real-time</li>
                        <li><i class="fas fa-check-circle"></i> View and manage bookings</li>
                        <li><i class="fas fa-check-circle"></i> Access performance analytics</li>
                    </ul>
                    <form action="hotel" method="get">
                        <button type="submit" class="action-btn">Manager Login</button>
                    </form>
                </div>
                
                <!-- Customer Card -->
                <div class="user-card">
                    <div class="user-icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <h3>Traveler</h3>
                    <ul class="features-list">
                        <li><i class="fas fa-check-circle"></i> Search hotels by location</li>
                        <li><i class="fas fa-check-circle"></i> Compare room types and prices</li>
                        <li><i class="fas fa-check-circle"></i> Book rooms instantly</li>
                        <li><i class="fas fa-check-circle"></i> Manage your bookings</li>
                        <li><i class="fas fa-check-circle"></i> Cancel bookings when needed</li>
                    </ul>
                    <form action="cust" method="get">
                        <button type="submit" class="action-btn">Customer Login</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <!-- How It Works -->
    <section class="how-it-works" id="how-it-works">
        <div class="user-types-container">
            <div class="section-header">
                <h2>How HotelHub Works</h2>
                <p>Our simple process connects hotel managers with potential guests</p>
            </div>
            
            <div class="steps-container">
                <div class="step-card">
                    <div class="step-number">1</div>
                    <h3>Hotels Register</h3>
                    <p>Hotel managers create accounts and list their properties with room types, amenities, and pricing.</p>
                </div>
                
                <div class="step-card">
                    <div class="step-number">2</div>
                    <h3>Guests Search</h3>
                    <p>Travelers search for hotels by location, dates, and preferences to find perfect accommodations.</p>
                </div>
                
                <div class="step-card">
                    <div class="step-number">3</div>
                    <h3>Book & Manage</h3>
                    <p>Guests book rooms instantly, and hotels manage reservations through their dashboard.</p>
                </div>
            </div>
        </div>
    </section>
    
   
    
    <!-- Footer -->
    <footer id="contact">
        <div class="footer-container">
            <div class="footer-column">
                <h4>About HotelHub</h4>
                <p>The leading platform connecting hotels with guests worldwide. We simplify the booking process for both parties.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            
            <div class="footer-column">
                <h4>For Hotels</h4>
                <ul>
                    <li><a href="#">Register Your Hotel</a></li>
                    <li><a href="#">Pricing Plans</a></li>
                    <li><a href="#">Management Dashboard</a></li>
                    <li><a href="#">Support Center</a></li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h4>For Travelers</h4>
                <ul>
                    <li><a href="#">Search Hotels</a></li>
                    <li><a href="#">Booking Guide</a></li>
                    <li><a href="#">Cancellation Policy</a></li>
                    <li><a href="#">Travel Tips</a></li>
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
            &copy; 2025 HotelHub. All rights reserved.
        </div>
    </footer>
</body>
</html>