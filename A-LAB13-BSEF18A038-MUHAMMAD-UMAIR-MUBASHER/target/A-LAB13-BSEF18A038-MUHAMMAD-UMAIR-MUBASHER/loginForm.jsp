<%--
  Created by IntelliJ IDEA.
  User: MuhammadUmair
  Date: 1/16/2021
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task-02</title>
    <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .form{
            background-color: #fac866;
            padding: 50px;
            border-radius: 15px;
            margin: 15px;
        }
    </style>
</head>
<body style="text-align: center; font-family: 'Comic Sans MS'">
<div class="container">
    <div class="form row">
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
            <div>
                <button id="login-btn">Login</button>
            </div>
            <div id="message"></div>
        </div>
    </div>
</div>

<script>
    document.getElementById("login-btn").addEventListener('click', (function() {
            $.ajax({
                url:"verifyLoginForm",
                type: "POST",
                dataType: 'text',
                contentType: 'application/x-www-form-urlencoded',
                data:{
                    "username":document.getElementById("username").value,
                    "password":document.getElementById("pwd").value
                },
                success: function (response) {
                    console.log(response)
                    if(response==="successful"){
                        alert("Congratulation! You Have Successfully Logged In")
                        $(location).attr('href','index.jsp');
                    }else{
                        document.getElementById("message").innerHTML="<h5 class='text-danger'>Login Not Successful......!</h5>";
                    }
                },
                error: function (response){
                    console.log("Error");
                }
            });
        })
    )
</script>
</body>
</html>
