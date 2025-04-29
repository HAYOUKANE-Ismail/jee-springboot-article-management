<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Article Manager</title>
    <link href="webjars/bootstrap/4.6.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="webjars/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .login-card {
            max-width: 400px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .login-header {
            background: linear-gradient(to right, #007bff, #0056b3);
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }
        .login-body {
            padding: 20px;
        }
        .login-footer {
            padding: 15px;
            text-align: center;
            border-top: 1px solid #eee;
        }
        .icon-spacing {
            margin-right: 8px;
        }
    </style>
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.6.1/js/bootstrap.min.js"></script>
</head>
<body class="bg-light">
<div class="container">
    <div class="login-container">
        <div class="card login-card">
            <div class="login-header">
                <h3 class="mb-0"><i class="fa fa-user-circle fa-2x mb-3"></i></h3>
                <h4 class="mb-0">Article Manager</h4>
                <p class="mb-0 mt-2">Sign in to your account</p>
            </div>
            <div class="login-body">
                <!-- Display Error Message if Login or Password is Incorrect -->
                <c:if test="${not empty AccountIncorrect}">
                    <div class="alert alert-danger">
                        <i class="fa fa-exclamation-circle icon-spacing"></i>${AccountIncorrect}
                    </div>
                </c:if>
                <!-- Login Form -->
                <form action="${pageContext.request.contextPath}/login.do" method="post">
                    <div class="form-group">
                        <label for="login"><i class="fa fa-user icon-spacing"></i>Username</label>
                        <input type="text" id="login" class="form-control" name="username" placeholder="Enter your username" required>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fa fa-lock icon-spacing"></i>Password</label>
                        <input type="password" id="password" class="form-control" name="password" placeholder="Enter your password" required>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="rememberMe">
                            <label class="custom-control-label" for="rememberMe">Remember me</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">
                        <i class="fa fa-sign-in icon-spacing"></i>Sign In
                    </button>
                </form>
            </div>
            <div class="login-footer">
                <a href="forgot-password.do">
                    <i class="fa fa-key icon-spacing"></i>Forgot Password?
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>