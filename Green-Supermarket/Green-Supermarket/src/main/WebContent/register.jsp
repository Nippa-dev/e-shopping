<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="includes/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Green Supermarket Register</title>
  
</head>
<body>

    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Registration</div>
            <div class="card-body">
                <form action="register" method="post">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" placeholder="Enter Your Name" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" placeholder="******" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%-- Include the footer --%>
    <%@include file="includes/footer.jsp"%>
</body>
</html>
