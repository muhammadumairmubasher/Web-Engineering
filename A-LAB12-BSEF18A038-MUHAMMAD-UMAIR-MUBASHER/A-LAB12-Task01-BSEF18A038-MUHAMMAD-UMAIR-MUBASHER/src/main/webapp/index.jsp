<%--
  Created by IntelliJ IDEA.
  User: MuhammadUmair
  Date: 12/29/2020
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width initial-scale=1" >
    <meta charset="UTF-8">
    <title>Diary Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="jumbotron text-center">
    <h1>DIGITAL DIARY</h1>
</div>
<div class="container form">
    <div class="row ">
        <div class="col-sm-6">
            <h1>Login</h1>
            <form action="login" class="form" method="post">
                <div class="form-group row">
                    <div class="col-sm-12">
                        <div class="form-group row">
                            <label for="username" class="col-sm-2 col-form-label">Username: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="Username" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="pwd" class="col-sm-2 col-form-label">Password: </label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control form-control-sm" id="pwd" name="pwd" placeholder="Password" required>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    String error=(String) session.getAttribute("error");
                    if (error!=null) {
                %>
                <p style="color: red"> <%=error%> </p>
                <% } %>
                <button class="button btn-primary" type="submit">Login</button>
                <br/><br/><br/><br/><br/>
            </form>

        </div>
        <div class="col-sm-6">
            <h1>SignUp</h1>
            <form action="signup" method="post" class="form">
                <div class="form-group row">
                    <div class="col-sm-12">
                        <div class="form-group row">
                            <label for="uname" class="col-sm-2 col-form-label">Enter Username: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control-sm" id="uname" name="uname" placeholder="Enter New Username" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="newPwd" class="col-sm-2 col-form-label">Enter Password: </label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control form-control-sm" id="newPwd" name="newPwd" placeholder="New Password" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="confirmPwd" class="col-sm-2 col-form-label">Confirm Password: </label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control form-control-sm" id="confirmPwd" name="confirmPwd" placeholder="Confirm Password" required>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    String pwdError=(String) session.getAttribute("pwdError");
                    String message=(String) session.getAttribute("message");
                    if (message!=null) {
                %>
                <p style="color: green"> <%=message%> </p>
                <% }
                    if (pwdError!=null) {
                %>
                <p style="color: red"> <%=pwdError%> </p>
                <% } %>
                <button class="button btn-primary" type="submit">SingUp</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>