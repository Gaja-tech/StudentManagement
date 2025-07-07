<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
			body{
				background:url('/img/sm_background.jpg');
			
			}	
			.mb-4{
				color:white;
			}
		</style>
	
</head>
<body>
	
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Student Management</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/students/form">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/students/list">View</a>
                </li>
				<li class="nav-item">
				    <a class="nav-link" href="/students/login">Logout</a>
			    </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
	<center>
    <h1 class="mb-4">All Students</h1></center>
	
	<form action="/students/search" method="get" class="mb-4 d-flex">
	    <input type="text" name="keyword" class="form-control me-2" placeholder="Search by name or department" value="${keyword}">
	    <button type="submit" class="btn btn-outline-primary">Search</button>
	</form>

    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.department}</td>
                    <td>
                        <a href="/students/edit/${student.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/students/delete/${student.id}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
