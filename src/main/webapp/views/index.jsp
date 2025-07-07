<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
			background:url('/img/sm_background.jpg');
            /*background: #f8f9fa;*/
        }
        .navbar {
            margin-bottom: 40px;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Student Management</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/students/form">Add Student</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/students/list">View Students</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Form Section -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container">
                <h3 class="text-center mb-4">Add New Student</h3>
                <form method="post" action="/students/save">
                    <div class="mb-3">
                        <label for="name" class="form-label">Student Name</label>
                        <input type="text" class="form-control" name="name" id="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="department" class="form-label">Department</label>
                        <input type="text" class="form-control" name="department" id="department" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Save Student</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
