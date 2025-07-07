<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
			body{
				background:url('/img/sm_background.jpg');
			
			}	
			h1{
				color:white;
			}
		</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Student Management</a>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="/students/form">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="/students/list">View Students</a></li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <center><h1>Edit Student</h1></center>
    <form action="/students/update/${student.id}" method="post">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" class="form-control" value="${student.name}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Department</label>
            <input type="text" name="department" class="form-control" value="${student.department}" required>
        </div>
        <button type="submit" class="btn btn-success">Update</button>
        <a href="/students/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
