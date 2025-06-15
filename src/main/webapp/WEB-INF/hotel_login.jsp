<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Manager | HotelHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-dark: #4338ca;
            --primary-light: #a5b4fc;
            --secondary: #f59e0b;
            --secondary-dark: #d97706;
            --light: #f8fafc;
            --dark: #1e293b;
            --darker: #0f172a;
            --success: #10b981;
            --danger: #ef4444;
            --gray: #64748b;
            --light-gray: #e2e8f0;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f1f5f9 0%, #e2e8f0 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
        }
        
        /* Navigation */
        .navbar {
            background-color: var(--darker);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
            background-color: var(--secondary);
            transition: width 0.3s ease;
        }
        
        .navbar-links a:hover::after {
            width: 100%;
        }
        
        .navbar-links a:hover {
            color: var(--secondary);
        }
        
        .navbar-actions {
            display: flex;
            gap: 1rem;
        }
        
        .btn-outline {
            padding: 0.5rem 1.5rem;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid var(--secondary);
            background: transparent;
            color: white;
        }
        
        .btn-outline:hover {
            background-color: var(--secondary);
            color: var(--darker);
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 80px);
        }
        
        .auth-container {
            display: flex;
            width: 100%;
            max-width: 1100px;
            background-color: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
            position: relative;
            z-index: 1;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .auth-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 10px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            z-index: 2;
        }
        
        .auth-image {
            flex: 1;
            background: linear-gradient(rgba(30, 41, 59, 0.9), rgba(30, 41, 59, 0.85)), 
                        url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 4rem 3rem;
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .auth-image::after {
            content: '';
            position: absolute;
            bottom: -100px;
            right: -100px;
            width: 300px;
            height: 300px;
            background-color: var(--secondary);
            border-radius: 50%;
            opacity: 0.1;
            z-index: 1;
        }
        
        .auth-image::before {
            content: '';
            position: absolute;
            top: -50px;
            left: -50px;
            width: 200px;
            height: 200px;
            background-color: var(--secondary);
            border-radius: 50%;
            opacity: 0.1;
            z-index: 1;
        }
        
        .auth-image-content {
            position: relative;
            z-index: 2;
        }
        
        .auth-image h1 {
            font-size: 2.8rem;
            margin-bottom: 1.5rem;
            line-height: 1.3;
            font-weight: 700;
        }
        
        .auth-image p {
            margin-bottom: 2.5rem;
            opacity: 0.9;
            font-size: 1.2rem;
            max-width: 90%;
        }
        
        .auth-image ul {
            margin-left: 0;
            list-style: none;
        }
        
        .auth-image li {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: flex-start;
            font-size: 1.1rem;
            position: relative;
            padding-left: 2.5rem;
        }
        
        .auth-image li::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0.5rem;
            width: 1.5rem;
            height: 1.5rem;
            background-color: var(--secondary);
            border-radius: 50%;
            opacity: 0.2;
        }
        
        .auth-image i {
            position: absolute;
            left: 0.25rem;
            top: 0.5rem;
            color: white;
            font-size: 1rem;
            z-index: 2;
        }
        
        .auth-forms {
            flex: 1;
            padding: 4rem 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: white;
        }
        
        .auth-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .auth-header h2 {
            font-size: 2.4rem;
            color: var(--primary);
            margin-bottom: 0.8rem;
            font-weight: 700;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .auth-header p {
            color: var(--gray);
            font-size: 1.1rem;
        }
        
        .form-tabs {
            display: flex;
            margin-bottom: 2.5rem;
            border-bottom: 2px solid var(--light-gray);
            position: relative;
        }
        
        .tab-btn {
            flex: 1;
            padding: 1rem;
            text-align: center;
            background: none;
            border: none;
            cursor: pointer;
            font-weight: 500;
            color: var(--gray);
            font-size: 1.1rem;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .tab-btn.active {
            color: var(--primary);
            font-weight: 600;
        }
        
        .tab-indicator {
            position: absolute;
            bottom: -2px;
            left: 0;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            transition: all 0.3s ease;
            border-radius: 3px 3px 0 0;
        }
        
        .tab-content {
            display: none;
            animation: fadeIn 0.4s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .tab-content.active {
            display: block;
        }
        
        .form-group {
            margin-bottom: 1.8rem;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.8rem;
            font-weight: 500;
            color: var(--dark);
            font-size: 1rem;
        }
        
        .form-control {
            width: 100%;
            padding: 1.1rem 1.5rem 1.1rem 3rem;
            border: 2px solid var(--light-gray);
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            font-size: 1rem;
            background-color: #f8fafc;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
            background-color: white;
        }
        
        .input-icon {
            position: absolute;
            left: 1.2rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            font-size: 1.1rem;
        }
        
        .btn {
            display: inline-block;
            padding: 1.1rem 2rem;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            width: 100%;
            font-size: 1.1rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .btn-primary {
            background: linear-gradient(90deg, var(--primary), var(--primary-dark));
            color: white;
            box-shadow: 0 4px 15px rgba(79, 70, 229, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(79, 70, 229, 0.4);
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
        
        .auth-footer {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid var(--light-gray);
            color: var(--gray);
            font-size: 0.95rem;
        }
        
        .auth-footer a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .auth-footer a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }
        
        .password-toggle {
            position: absolute;
            right: 1.2rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--gray);
            font-size: 1.1rem;
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 0.5rem;
            accent-color: var(--primary);
        }
        
        .remember-me label {
            color: var(--gray);
            font-size: 0.95rem;
        }
        
        .forgot-password a {
            color: var(--primary);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .forgot-password a:hover {
            text-decoration: underline;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background-color: var(--light-gray);
            margin: 0 1rem;
        }
        
        .social-login {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .social-btn {
            flex: 1;
            padding: 0.8rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1px solid var(--light-gray);
            background-color: white;
            color: var(--dark);
        }
        
        .social-btn i {
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }
        
        .social-btn.google {
            color: #db4437;
        }
        
        .social-btn.facebook {
            color: #4267B2;
        }
        
        .social-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        
        @media (max-width: 992px) {
            .auth-image {
                display: none;
            }
            
            .auth-forms {
                padding: 3rem 2rem;
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
            }
            
            .navbar-actions {
                width: 100%;
                justify-content: center;
            }
            
            .container {
                margin: 1rem auto;
                padding: 0 1rem;
            }
            
            .auth-forms {
                padding: 2rem 1.5rem;
            }
            
            .auth-header h2 {
                font-size: 2rem;
            }
            
            .tab-btn {
                font-size: 1rem;
                padding: 0.8rem;
            }
            
            .social-login {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fas fa-hotel"></i>
            <h2>HotelHub</h2>
        </a>
        <div class="navbar-links">
            <a href="/">Home</a>
            <a href="/#how-it-works">Features</a>
            <a href="/#contact">Contact</a>
        </div>
        <div class="navbar-actions">
            <a href="/cust" class="btn-outline">Customer Login</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="auth-container">
            <div class="auth-image">
                <div class="auth-image-content">
                    <h1>Transform Your Hotel Management</h1>
                    <p>Join our platform to streamline operations and maximize your property's potential</p>
                    <ul>
                        <li><i class="fas fa-chart-line"></i> Real-time performance analytics</li>
                        <li><i class="fas fa-calendar-check"></i> Seamless booking management</li>
                        <li><i class="fas fa-bell"></i> Instant notifications</li>
                        <li><i class="fas fa-users"></i> Guest relationship tools</li>
                        <li><i class="fas fa-cog"></i> Easy property configuration</li>
                    </ul>
                </div>
            </div>
            
            <div class="auth-forms">
                <div class="auth-header">
                    <h2>Hotel Manager Portal</h2>
                    <p>Access your property management dashboard</p>
                </div>
                
                <div class="form-tabs">
				    <button class="tab-btn active" data-tab="login" onclick="switchTab('login')">Login</button>
				    <button class="tab-btn" data-tab="signup" onclick="switchTab('signup')">Register</button>
				    <div class="tab-indicator" style="width: 50%; left: 0;"></div>
				</div>

                
                <div id="login" class="tab-content active">
                    <form action="hotel_login" method="post">
                        <div class="form-group">
                            <label for="login-username">Username</label>
                            <input type="text" id="login-username" name="husername" class="form-control" placeholder="Enter your username" required>
                            <i class="fas fa-user input-icon"></i>
                        </div>
                        <div class="form-group">
                            <label for="login-password">Password</label>
                            <input type="password" id="login-password" name="hpassword" class="form-control" placeholder="Enter your password" required>
                            <i class="fas fa-eye password-toggle" onclick="togglePassword('login-password', this)"></i>
                        </div>
                        <div class="remember-forgot">
                            <div class="remember-me">
                                <input type="checkbox" id="remember-me">
                                <label for="remember-me">Remember me</label>
                            </div>
                            <div class="forgot-password">
                                <a href="#">Forgot password?</a>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Login to Dashboard</button>
                    </form>
                    
                    
                    <div class="auth-footer">
                        Don't have an account? <a href="#" onclick="switchTab('signup')">Register your hotel</a>
                    </div>
                </div>
                
                <div id="signup" class="tab-content">
                    <form action="hotel_signup" method="post">
                        <div class="form-group">
                            <label for="signup-username">Username</label>
                            <input type="text" id="signup-username" name="husername" class="form-control" placeholder="Choose a username" required>
                            <i class="fas fa-user input-icon"></i>
                        </div>
                        <div class="form-group">
                            <label for="signup-email">Business Email</label>
                            <input type="email" id="signup-email" name="hemail" class="form-control" placeholder="your@business.com" required>
                            <i class="fas fa-envelope input-icon"></i>
                        </div>
                        <div class="form-group">
                            <label for="signup-password">Password</label>
                            <input type="password" id="signup-password" name="hpassword" class="form-control" placeholder="Create a password" required>
                            <i class="fas fa-eye password-toggle" onclick="togglePassword('signup-password', this)"></i>
                        </div>
                        <div class="form-group">
                            <label for="signup-confirm-password">Confirm Password</label>
                            <input type="password" id="signup-confirm-password" class="form-control" placeholder="Confirm your password" required>
                            <i class="fas fa-eye password-toggle" onclick="togglePassword('signup-confirm-password', this)"></i>
                        </div>
                        <button type="submit" class="btn btn-primary">Create Hotel Account</button>
                    </form>
            
                    
                    <div class="auth-footer">
                        Already registered? <a href="#" onclick="switchTab('login')">Login to your account</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Tab switching functionality
        function switchTab(tabId) {
            // Hide all tab contents
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Show selected tab content
            document.getElementById(tabId).classList.add('active');
            
            // Update active tab button
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
                if (btn.getAttribute('data-tab') === tabId) {
                    btn.classList.add('active');
                }
            });
            
            // Move tab indicator
            const tabIndicator = document.querySelector('.tab-indicator');
            const activeTab = document.querySelector('.tab-btn.active');
            if (activeTab) {
                const tabWidth = activeTab.offsetWidth;
                const tabLeft = activeTab.offsetLeft;
                tabIndicator.style.width = `${tabWidth}px`;
                tabIndicator.style.left = `${tabLeft}px`;
            }
        }
        
        // Password toggle functionality
        function togglePassword(inputId, icon) {
            const input = document.getElementById(inputId);
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
        
        // Initialize tab buttons
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const tabId = this.getAttribute('data-tab');
                switchTab(tabId);
            });
        });
        
        // Add animation to form inputs when they come into view
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = 1;
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, { threshold: 0.1 });
        
        document.querySelectorAll('.form-group').forEach(group => {
            group.style.opacity = 0;
            group.style.transform = 'translateY(20px)';
            group.style.transition = 'all 0.4s ease';
            observer.observe(group);
        });
    </script>
</body>
</html>