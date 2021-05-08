<%--
  Created by IntelliJ IDEA.
  User: MuhammadUmair
  Date: 12/19/2020
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WEB-LAB11-BSEF18A038</title>
    <link type="text/css" rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="reg">Registration Form</div>
<div class="form" >
    <form action="verify.jsp" method ="post">
        <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label">Name: </label>
            <div class="col-sm-8">
                <input type="text" class="form-control form-control-sm" id="name" name="name" placeholder="Name">
            </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-sm-2 col-form-label">Email: </label>
            <div class="col-sm-8">
                <input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="Email">
            </div>
        </div>
        <div class="form-group row">
            <label for="pwd" class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-8">
                <input type="password" class="form-control form-control-sm" id="pwd" name="pwd" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Degree</label>
            <div class="col-sm-8">
                <select class="custom-select my-1 mr-sm-2 form-control form-control-sm " name="degree">
                    <option name="degree" value="Computer Science">Computer Science</option>
                    <option name="degree" value="Software Engineering">Software Engineering</option>
                    <option  name="degree" value="Information Technology">Information Technology</option>
                </select>
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <label class="col-sm-2 col-form-label">Section</label>
                <div class="col-sm-8">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="section" id="Morning" value="Morning">
                        <label class="form-check-label" for="Morning"><b>Morning</b></label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="section" id="Afternoon" value="Afternoon">
                        <label class="form-check-label" for="Afternoon"><b>Afternoon</b></label>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Subjects</label>
            <div class="col-sm-10">
                <div class="form-check">
                    <input class="form-check-input" value="Mathematics" type="checkbox" name="subject" id="Mathematics">
                    <label class="form-check-label mr-4" for="Mathematics"><b>Mathematics</b></label>

                    <input class="form-check-input" value="Computer Vision"  type="checkbox" name="subject"  id="Computer Vision">
                    <label class="form-check-label mr-4" for="Computer Vision"><b>Computer Vision</b></label>

                    <input class="form-check-input" value="Artificial Intelligence"  type="checkbox" name="subject"  id="Artificial Intelligence">
                    <label class="form-check-label mr-4" for="Artificial Intelligence"><b>Artificial Intelligence</b></label>

                    <input class="form-check-input" value="Web Engineering" type="checkbox" name="subject"  id="Web Engineering">
                    <label class="form-check-label mr-4" for="Web Engineering"><b>Web Engineering</b></label>
                </div>
            </div>
        </div>
        </br>
        <button type="submit" class="btn btn-primary" name="submitBtn">Save and Preview</button>
       <%
           String error=(String) session.getAttribute("error");
            if (error!=null)
            {
       %>
        <p class="err"> <%=error%> </p>
        <%
            }
        %>
    </form>
</div>
</body>
</html>
