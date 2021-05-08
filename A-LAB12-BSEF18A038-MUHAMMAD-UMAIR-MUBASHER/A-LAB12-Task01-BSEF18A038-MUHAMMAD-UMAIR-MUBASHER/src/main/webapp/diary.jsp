<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container welcomeNote">
    <h1>Welcome To Digital Diary!</h1>
</div>
<div class="container my-diary">
    <div class="row">
        <div class="col-12">
            <h2>My Diary</h2>
        </div>
        <div class="col-sm-6 ">
            <div class="col-sm-12">
                <h3 class="text-center">Title</h3>
                <table class="table">
                    <thead>
                    <tr class="warning">
                        <th scope="col">ID</th>
                        <th scope="col">Title</th>
                        <th scope="col">Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            final String DB_URL="jdbc:mysql://localhost:3306/diary_db";
                            final String DB_USER="root";
                            final String DB_PASSWORD="umair123";
                            Connection conn= DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
                            String query="SELECT * FROM `diary` ORDER By titleName";
                            Statement stmt=conn.createStatement();
                            stmt.executeQuery(query);
                            ResultSet rs=stmt.getResultSet();
                            while(rs.next()){
                                int titleID=rs.getInt("titleID");
                                String titleName=rs.getString("titleName");
                                String date=rs.getString("date");
                    %>
                    <tr class="warning">
                        <th scope="row"><%=titleID%></th>
                        <td><%=titleName%></td>
                        <td><span class="badge badge-pill" ><%=date%></span></td>
                    </tr>
                    <%
                            }
                        }catch (Exception e){
                            e.printStackTrace();
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-sm-5">
            <h3>Note</h3>
            <form action="display" method="post">
                <div class="form-group row">
                    <div class="col-sm-12">
                        <div class="form-group row">
                            <label for="titleName" class="col-sm-2 col-form-label">Title Name:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control-sm" id="titleName" name="titleName" placeholder="Enter Title to See Notes" required>
                            </div>
                        </div>
                        <button type="submit" class="btn-primary">Show Notes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <%
            String err="Error...!Invalid Title Name! or No Title Exist!";
            String inputTitle=(String) session.getAttribute("inputTitle");
            String notesAgainstTitle=(String) session.getAttribute("notesAgainstTitle");
            if (notesAgainstTitle!=null && inputTitle!=null) {
        %>
        <div class="notes">
            <h2><%=(!inputTitle.equals(""))?inputTitle:err%></h2>
            <p> <%=notesAgainstTitle%> </p>
        </div>
        <% }%>
    </div>
</div>
<div class="container add-entry">
    <div class="row">
        <div class="col-12">
            <h2>Add An Entry</h2>
        </div>
        <div class="col-sm-12 ">
            <form action="addEntry" method="post">
                <div class="form-group row">
                    <div class="col-sm-12">
                        <div class="form-group row">
                            <label for="tName" class="col-sm-2 col-form-label">Enter Title: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control-sm" id="tName" name="tName" placeholder="Enter New Title" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Enter Description: </label>
                            <div class="col-sm-10">
                                <textarea rows="5" class="form-control form-control-sm" id="description" name="description" placeholder="Place Your Description or Notes"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    String entryError=(String) session.getAttribute("entryError");
                    String entryMessage=(String) session.getAttribute("entryMessage");
                    if (entryMessage!=null) {
                %>
                <p class="text-success"> <%=entryMessage%> </p>
                <% }
                    if (entryError!=null) {
                %>
                <p class="text-danger"> <%=entryError%> </p>
                <% } %>
                <button class="button btn-primary" type="submit">Add Entry</button>
            </form>
        </div>
    </div>
</div>
<div class="container delete-entry">
    <div class="row">
        <div class="col-12">
            <h2>Delete Entries</h2>
        </div>
        <div class="col-sm-12 ">
            <div class="row">
                <form action="confirmation" method="post">
                    <div class="form-group row">
                        <label for="input" class="col-sm-2 col-form-label">Enter Title: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" id="input" name="input" placeholder="Enter Title that You Want to Delete" required>
                        </div>
                    </div>
                    <button class="button btn-danger" type="submit">Delete</button>
                </form>
            </div>
                <%
                    String error="Error...! Invalid Title Name! or No Record Exist!";
                    String deleteInputTitle=(String) request.getSession().getAttribute("deleteInputTitle");
                    String notesAgainstDeleteInputTitle=(String) request.getSession().getAttribute("notesAgainstDeleteInputTitle");
                    String deleteInputDate=(String) request.getSession().getAttribute("deleteInputDate");
                    if (notesAgainstDeleteInputTitle!=null && deleteInputTitle!=null) {
                %>
            <div class="row">
                <div class="col-sm-12 notes">
                    <div class="col-sm-11">
                        <h2><%=(deleteInputTitle!="")?deleteInputTitle:error%></h2>
                        <%
                            if (notesAgainstDeleteInputTitle!=""){
                        %>
                        <p> <%=notesAgainstDeleteInputTitle%> </p>
                        <form action="deleteEntry" method="post">
                            <button type="submit" class="btn-danger" style="margin-top:20px">Confirm Delete</button>
                        </form>
                    </div>
                    <div class="col-sm-1">
                        <span class="badge badge-primary badge-pill"><%=deleteInputDate%></span>
                    </div>
                    <%
                            }
                    %>
                </div>
                <%
                    }
                    String deleteMessage=(String) request.getSession().getAttribute("deleteMessage");
                    if(deleteMessage!=null){
                %>
                <p class="text-success"> <%=deleteMessage%> </p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
<div class="container update-entry">
    <div class="row">
        <div class="col-12">
            <h2>Update Entry</h2>
        </div>
        <div class="col-sm-12 ">
            <div class="row">
                <form action="updateEntry" method="post">
                    <div class="form-group row">
                        <label for="ID" class="col-sm-2 col-form-label">Enter Title ID: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" id="ID" name="ID" placeholder="Enter ID of title that you want to Update" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="titleValue" class="col-sm-2 col-form-label">Enter Title: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" id="titleValue" name="titleValue" placeholder="Place Updated Title (Optional)">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="date" class="col-sm-2 col-form-label">Enter Date: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" id="date" name="date" placeholder="Place Updated Date in format 'yyyy-mm-dd' (Optional)">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="notes" class="col-sm-2 col-form-label">Enter Notes: </label>
                        <div class="col-sm-10">
                            <textarea rows="5" class="form-control form-control-sm" id="notes" name="notes" placeholder="Place Your Updated Notes (Optional)"></textarea>
                        </div>
                    </div>
                    <button class="button btn-primary" type="submit">Update</button>
                </form>
            </div>
            <div class="row">
                <%
                    String updateError=(String) session.getAttribute("updateError");
                    String updateMessage=(String) session.getAttribute("updateMessage");
                    if (updateMessage!=null) {
                %>
                <p class="text-success"> <%=updateMessage%> </p>
                <% }
                    if (updateError!=null) {
                %>
                <p class="text-danger"> <%=updateError%> </p>
                <% } %>
            </div>
        </div>
    </div>
</div>
<div class="container search-Entry">
    <div class="row">
        <div class="col-sm-12">
            <h2>Search Entries</h2>
        </div>
        <div class="col-sm-12">
            <form action="diary.jsp" method="post">
                <div class="form-group row">
                    <label for="startingDate" class="col-sm-2 col-form-label">Enter Starting Date: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control form-control-sm" id="startingDate" name="startingDate" placeholder="Place Starting Date in format 'yyyy-mm-dd'" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="endingDate" class="col-sm-2 col-form-label">Enter Ending Date: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control form-control-sm" id="endingDate" name="endingDate" placeholder="Place Ending Date in format 'yyyy-mm-dd'" required>
                    </div>
                </div>
                <button class="button btn-primary" type="submit">Search</button>
            </form>
        </div>
        <div class="col-sm-12">
            <%
                String startingDate=request.getParameter("startingDate");
                String endingDate=request.getParameter("endingDate");
                request.getSession().setAttribute("searchError","");
                //Maintain Other classes session
                request.getSession().setAttribute("inputTitle",null);
                request.getSession().setAttribute("notesAgainstTitle",null);
                request.getSession().setAttribute("entryError",null);
                request.getSession().setAttribute("entryMessage",null);
                request.getSession().setAttribute("deleteMessage", null);
                request.getSession().setAttribute("entryMessage", null);
                request.getSession().setAttribute("notesAgainstDeleteInputTitle",null);
                request.getSession().setAttribute("deleteInputTitle",null);
                request.getSession().setAttribute("updateError",null);
                request.getSession().setAttribute("updateMessage",null);

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    final String DB_URL="jdbc:mysql://localhost:3306/diary_db";
                    final String DB_USER="root";
                    final String DB_PASSWORD="umair123";
                    Connection conn= DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
                    String query="SELECT* FROM `diary` WHERE date BETWEEN '"+startingDate+"' AND '"+endingDate+"'";
                    Statement stmt=conn.createStatement();
                    stmt.executeQuery(query);
                    ResultSet rs=stmt.getResultSet();
                    if(rs.next()){
                        stmt.executeQuery(query);
                        rs=stmt.getResultSet();
            %>
            <h3 class="text-center">Searched Title Record</h3>
            <table class="table">
                <thead>
                <tr class="warning">
                    <th scope="col">ID</th>
                    <th scope="col">Title</th>
                    <th scope="col">Notes</th>
                    <th scope="col">Date</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs.next()){
                        int titleID=rs.getInt("titleID");
                        String titleName=rs.getString("titleName");
                        String date=rs.getString("date");
                        String notes=rs.getString("notes");
                %>
                <tr class="warning">
                    <th scope="row"><%=titleID%></th>
                    <td><%=titleName%></td>
                    <td><%=notes%></td>
                    <td><span class="badge badge-pill" ><%=date%></span></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <%
                }
            }
            catch (Exception e){
                e.printStackTrace();
                request.getSession().setAttribute("searchError","Error...!");
            }
            String searchError=(String)request.getSession().getAttribute("searchError");
            if(searchError!=null){
        %>
        <p class="text-danger"><%=searchError%></p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
