<html>
<head>
    <title>Task-01</title>
    <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body style="text-align: center; font-family: 'Comic Sans MS'">
<h1>Student Management System(SMS)</h1>
<div id="dropdown">
    <label for="select"><b>SELECT CLASS: </b></label>
    <select id="select">
        <option selected>select class</option>
    </select>
</div><br>
<div class="container">
    <table border="1" class="table text-center" id="table">
        <thead>
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
        </tr>
        </thead>
        <tbody id="table-body"></tbody>
    </table>
</div>
<script>
    window.onload=function (){
        fetchDropDownData();
    }
    //Function that send AJAX CAll to DisplayOption Servlet
    function fetchDropDownData(){
        $.ajax({
            url: "displayOptions",
            success: function (response) {
                populateDropDownOptions(response);
            },
            error: function (xhr, status, message) {
                console.log("error");
            },
        })
    }

    //Function that dynamically populate dropdown options
    function populateDropDownOptions(response){
        const select = document.getElementById("select");
        for (let i=0;i < response.length;i++){
            const option = document.createElement("option");
            option.value = response[i].c_id;
            option.text = response[i].c_name;
            select.appendChild(option);
        }
    }
    document.getElementById("select").addEventListener('change', function (){
        const getValue = document.getElementById('select').selectedOptions[0].value;
        fetchTableData(getValue);
    });
    //Function that send AJAX CAll to DisplayTable Servlet
    function fetchTableData(getValue){
        $.ajax({
            url: "displayTable",
            data: {
                "selected":getValue
            },
            success: function (response) {
                //const tbody=document.getElementById("table-body");
                $('#table-body').empty();
                populateTable(response);
            },
            error: function (xhr, status, message) {
                console.log("error");
            },
        })
    }
    //Function that dynamically populate Table
    function populateTable(response) {
        const table = document.getElementById("table-body");
        for(let i = 0; i < response.length; i++)
        {
            const row = table.insertRow();
            let col1 = row.insertCell(0);
            let col2 = row.insertCell(1);
            col1.innerHTML = response[i].s_id;
            col2.innerHTML = response[i].name;
        }
    }
</script>
</body>
</html>
