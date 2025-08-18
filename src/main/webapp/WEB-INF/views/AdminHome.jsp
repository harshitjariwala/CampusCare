<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #6c63ff;
            --secondary-color: #4d44db;
            --dark-color: #2a2a72;
            --light-color: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            min-height: 100vh;
        }

        .admin-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .dashboard-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            height: 100%;
            background-color: white;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }

        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }

        .btn-admin {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 50px;
            padding: 10px 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-admin:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(108, 99, 255, 0.3);
            color: white;
        }

        .welcome-text {
            color: var(--dark-color);
            font-weight: 600;
        }

        .logout-btn {
            color: white;
            transition: all 0.2s ease;
        }

        .logout-btn:hover {
            color: #f8f9fa;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="admin-header mb-5">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="h3 mb-0">Admin Dashboard</h1>
                <a href="/logout" class="logout-btn">
                    <i class="fas fa-sign-out-alt me-1"></i> Logout
                </a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container my-5">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="welcome-text">Welcome back, Admin</h2>
                <p class="text-muted">Manage your system users and settings</p>
            </div>
        </div>

        <div class="row g-4">
            <!-- Add User Card -->
            <div class="col-md-4">
                <div class="dashboard-card p-4 text-center">
                    <div class="card-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <h3>Add User</h3>
                    <p class="text-muted mb-4">Create new student or admin accounts</p>
                    <a href="adduser" class="btn btn-admin">
                        <i class="fas fa-arrow-right me-2"></i> Go to Add User
                    </a>
                </div>
            </div>

            <!-- List Students Card -->
            <div class="col-md-4">
                <div class="dashboard-card p-4 text-center">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>List Students</h3>
                    <p class="text-muted mb-4">View and manage all student accounts</p>
                    <a href="liststudents" class="btn btn-admin">
                        <i class="fas fa-arrow-right me-2"></i> View Students
                    </a>
                </div>
            </div>

            <!-- List Admins Card -->
            <div class="col-md-4">
                <div class="dashboard-card p-4 text-center">
                    <div class="card-icon">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <h3>List Admins</h3>
                    <p class="text-muted mb-4">View and manage administrator accounts</p>
                    <a href="/admin/list-admins" class="btn btn-admin">
                        <i class="fas fa-arrow-right me-2"></i> View Admins
                    </a>
                </div>
            </div>
        </div>
    </main>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>