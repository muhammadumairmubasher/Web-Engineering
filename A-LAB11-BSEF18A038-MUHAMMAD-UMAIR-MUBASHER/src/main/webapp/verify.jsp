
<%--
  Created by IntelliJ IDEA.
  User: MuhammadUmair
  Date: 12/19/2020
  Time: 1:23s PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.sun.corba.se.impl.protocol.BootstrapServerRequestDispatcher" %>
<%@ page import="com.sun.corba.se.spi.protocol.RequestDispatcherDefault" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WEB-LAB11-BSEF18A038</title>
    <link type="text/css" rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String degree = request.getParameter("degree");
    String section = request.getParameter("section");
    String[] subjects = request.getParameterValues("subject");
    if (name==null||name.length()==0) {
        request.getSession().setAttribute("error", "Invalid Name! Please Enter name!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
    else if(email==null ||email.length()==0) {
        request.getSession().setAttribute("error", "Invalid Email! Please Enter Email!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
    else if(pwd==null || pwd.length()==0 ) {
        request.getSession().setAttribute("error", "Invalid Passward! Please Enter Password!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
    else if(degree==null||degree.length()==0 ) {
        request.getSession().setAttribute("error", "Invalid degree! Please Select Degree!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
     else if(section==null || section.length()==0 ) {
        request.getSession().setAttribute("error", "Invalid Section! Please Mark Section!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
    else if(subjects==null) {
        request.getSession().setAttribute("error", "Invalid Subject! Please Select at least one Subject!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
    else{
%>
<h1 class="welcomeNote">Hi <%=name%>! Information Provided by You...</h1>
<div class="form bg-s">
    <div>
        Name: <%=name%>
    </div>
    <div>
        Email: <span style="color:blue"><%=email%></span>
    </div>
    <div>
        Degree: <%=degree%>
    </div>
    <div>
        Section: <%= section%>
    </div>
    <div>
        Subject:
        <ul>
            <%
                for (int i = 0; i < subjects.length; i++) {
            %>
            <li><%=subjects[i]%>
            </li>
            <% }%>
        </ul>
    </div>
        <%
    }
%>
</div>
<div class="style">
    <div><a href="index.jsp"><button type="button" class="btn btn-danger">Go Back And Edit</button></a></div>
    <a href="success.jsp"><button type="button" class="btn btn-success">Approve and Continue</button></a></div>
</div>
</body>
</html>