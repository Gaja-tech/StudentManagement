<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
    <style>
        body { font-family: Arial; margin: 0; padding: 0; text-align: center; background:url('/img/sm_background.jpg');}
        nav { background: #333; padding: 1em; }
        nav a { color: white; text-decoration: none; margin-right: 15px; }
        .container { margin-top: 50px; }
        button { margin: 10px; padding: 10px 20px; }
		h2{
			color:white;
		}
    </style>
</head>
<body>
    <nav>
        <a href="/students/form">Add Student</a>
        <a href="/students/list">View Students</a>
    </nav>

    <div class="container">
        <h2>Are you sure you want to delete this student?</h2>
        <form action="/students/delete/${student.id}" method="post">
            <button type="submit">Yes, Delete</button>
            <a href="/students/list"><button type="button">Cancel</button></a>
        </form>
    </div>
</body>
</html>
