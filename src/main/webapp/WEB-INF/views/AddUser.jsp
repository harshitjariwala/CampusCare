<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register User</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --primary-color: #6c63ff;
            --secondary-color: #4d44db;
            --dark-color: #2a2a72;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow-x: hidden;
        }

        .background-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(108, 99, 255, 0.1);
            animation: float 15s infinite ease-in-out;
        }

        .shape:nth-child(1) {
            width: 300px;
            height: 300px;
            top: -50px;
            left: -50px;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 200px;
            height: 200px;
            bottom: -30px;
            right: -30px;
            animation-delay: 5s;
        }

        @keyframes float {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(20px, 20px) rotate(5deg);
            }
            50% {
                transform: translate(0, 40px) rotate(0deg);
            }
            75% {
                transform: translate(-20px, 20px) rotate(-5deg);
            }
        }

        .signup-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .signup-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .text-gradient {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 50px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(108, 99, 255, 0.3);
        }

        .btn-primary::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, var(--secondary-color), var(--dark-color));
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .btn-primary:hover::after {
            opacity: 1;
        }

        .form-control {
            border-radius: 10px;
            padding: 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.25);
        }

        .form-floating>label {
            padding: 1rem 1.25rem;
            color: #6c757d;
            transition: all 0.2s ease;
        }

        .form-floating>.form-control:focus~label,
        .form-floating>.form-control:not(:placeholder-shown)~label {
            transform: scale(0.85) translateY(-0.9rem) translateX(0.15rem);
            color: var(--primary-color);
        }

        .password-toggle-btn {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
            z-index: 5;
            padding: 0.5rem;
        }

        .password-input-group {
            position: relative;
        }

        .error-message {
            color: var(--danger-color);
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: block;
        }

        .is-invalid {
            border-color: var(--danger-color) !important;
        }

        .is-invalid~label {
            color: var(--danger-color) !important;
        }

        .role-radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }

        .role-radio {
            display: none;
        }

        .role-label {
            padding: 10px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .role-label i {
            font-size: 1.2rem;
        }

        .role-radio:checked + .role-label {
            border-color: var(--primary-color);
            background-color: rgba(108, 99, 255, 0.1);
        }

        /* Animations */
        .animate__animated {
            --animate-duration: 0.5s;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .signup-card {
                margin-top: 2rem;
                margin-bottom: 2rem;
            }
            
            .shape:nth-child(1) {
                width: 200px;
                height: 200px;
            }
            
            .shape:nth-child(2) {
                width: 150px;
                height: 150px;
            }
            
            .role-radio-group {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="background-animation">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card signup-card animate__animated animate__fadeIn">
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold text-gradient">Register New User</h2>
                            <p class="text-muted">Create a new admin or student account</p>
                        </div>
                        
                        <form id="registerForm" class="needs-validation" action="registeruser" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control ${result.hasFieldErrors('firstName') ? 'is-invalid' : ''}" 
                                               id="firstName" name="firstName">
                                        <label for="firstName">First Name</label>
                                    </div>
                                    <c:if test="${result.hasFieldErrors('firstName')}">
                                        <span class="error-message animate__animated animate__fadeIn">
                                            ${result.getFieldError("firstName").getDefaultMessage()}
                                        </span>
                                    </c:if>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control ${result.hasFieldErrors('lastName') ? 'is-invalid' : ''}" 
                                               id="lastName" name="lastName">
                                        <label for="lastName">Last Name</label>
                                    </div>
                                    <c:if test="${result.hasFieldErrors('lastName')}">
                                        <span class="error-message animate__animated animate__fadeIn">
                                            ${result.getFieldError("lastName").getDefaultMessage()}
                                        </span>
                                    </c:if>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-floating">
                                    <input type="email" class="form-control ${result.hasFieldErrors('email') ? 'is-invalid' : ''}" 
                                           id="email" name="email">
                                    <label for="email">Email Address</label>
                                </div>
                                <c:if test="${result.hasFieldErrors('email')}">
                                    <span class="error-message animate__animated animate__fadeIn">
                                        ${result.getFieldError("email").getDefaultMessage()}
                                    </span>
                                </c:if>
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-floating password-input-group">
                                    <input type="password" class="form-control ${result.hasFieldErrors('password') ? 'is-invalid' : ''}" 
                                           id="password" name="password">
                                    <label for="password">Password</label>
                                    <button type="button" class="password-toggle-btn" id="togglePassword">
                                        <i class="far fa-eye"></i>
                                    </button>
                                </div>
                                <c:if test="${result.hasFieldErrors('password')}">
                                    <span class="error-message animate__animated animate__fadeIn">
                                        ${result.getFieldError("password").getDefaultMessage()}
                                    </span>
                                </c:if>
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-floating password-input-group">
                                    <input type="password" class="form-control ${result.hasFieldErrors('confirmPassword') ? 'is-invalid' : ''}" 
                                           id="confirmPassword" name="confirmPassword">
                                    <label for="confirmPassword">Confirm Password</label>
                                    <button type="button" class="password-toggle-btn" id="toggleConfirmPassword">
                                        <i class="far fa-eye"></i>
                                    </button>
                                </div>
                                <c:if test="${result.hasFieldErrors('confirmPassword')}">
                                    <span class="error-message animate__animated animate__fadeIn">
                                        ${result.getFieldError("confirmPassword").getDefaultMessage()}
                                    </span>
                                </c:if>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label">Select Role</label>
                                <div class="role-radio-group">
                                    <input type="radio" id="roleAdmin" name="role" value="Admin" class="role-radio">
                                    <label for="roleAdmin" class="role-label">
                                        <i class="fas fa-user-shield"></i> Admin
                                    </label>
                                    
                                    <input type="radio" id="roleStudent" name="role" value="Student" class="role-radio">
                                    <label for="roleStudent" class="role-label">
                                        <i class="fas fa-user-graduate"></i> Student
                                    </label>
                                </div>
                                <c:if test="${result.hasFieldErrors('role')}">
                                    <span class="error-message animate__animated animate__fadeIn">
                                        ${result.getFieldError("role").getDefaultMessage()}
                                    </span>
                                </c:if>
                            </div>
                            
                            <button class="btn btn-primary w-100 py-3 mb-3 submit-btn" type="submit">
                                <span class="submit-text">Register User</span>
                                <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true"></span>
                            </button>
                            
                            <div class="text-center">
                                <p class="mb-0">Already have an account? <a href="login" class="text-decoration-none fw-bold">Log In</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password toggle functionality
            function setupPasswordToggle(inputId, buttonId) {
                const passwordInput = document.getElementById(inputId);
                const toggleButton = document.getElementById(buttonId);
                
                toggleButton.addEventListener('click', function() {
                    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordInput.setAttribute('type', type);
                    
                    // Toggle eye icon
                    const icon = this.querySelector('i');
                    icon.classList.toggle('fa-eye');
                    icon.classList.toggle('fa-eye-slash');
                });
            }
            
            // Initialize toggle buttons
            setupPasswordToggle('password', 'togglePassword');
            setupPasswordToggle('confirmPassword', 'toggleConfirmPassword');
        });
    </script>
</body>
</html>