//data.js
let students = [
    {
        name: "Bilal Ali",
        rollNo: "bcsf16a030",
        degree: "BS.CS",
        semester: "7",
        subjects: [
            {name: "Programming", grade: "A"},
            {name: "Discrete Math", grade: "A-"},
            {name: "OOP", grade: "A+"}

        ]
    },
    {
        name: "Maira Akram",
        rollNo: "bcsf16a019",
        degree: "BS.CS",
        semester: "8",
        subjects: [
            {name: "Programming", grade: "C"},
            {name: "Discrete Math", grade: "A"},
            {name: "OOP", grade: "C+"}

        ]
    },{
        name: "Hasham Sabir",
        rollNo: "bcsf16a042",
        degree: "BS.CS",
        semester: "7",
        subjects: [
            {name: "Programming", grade: "C"},
            {name: "Discrete Math", grade: "A"},
            {name: "OOP", grade: "C+"}

        ]
    }
]
//index.js
//your code here
$(document).ready(function(){
    for (let i =0; i < students.length; i++) {
    $("#studentLoginDropdownMenu").append(`<div id=in-btn${i}> &nbsp ${students[i].name} </div> <br>` );
    $(`#in-btn${i}`).click(function(){
        $("#name").html(`Name:&nbsp${students[i].name}`);
        $("#rollno").html(`Roll No:&nbsp${students[i].rollNo}</b>`);
        $("#semester").html(`Semester:&nbsp${students[i].semester}</b>`);
        $("#studentInfoTableBody").html(` 
        <tr>
            <td>&nbsp&nbsp${students[i].name}</td>
            <td>&nbsp&nbsp${students[i].rollNo}</td>
            <td>&nbsp&nbsp${students[i].semester}</td>
            <td>&nbsp&nbsp <button id=result-${i}>View Result</button></td>
        </tr>`);

        $(`#result-${i}`).click(function(){
            let CGPA=0.0;
          for (let j = 0; j < students[i].subjects.length; j++) {
            $("#result").append(`
            <tr>
                <td>${students[i].subjects[j].name}</td>
                <td>${students[i].subjects[j].grade}</td>
            </tr>`);
          
            switch (students[i].subjects[j].grade) {
                case "A+": case "A":
                    CGPA+=4.0;
                    break;
                case "A-":
                     CGPA+=3.7;
                     break;
                case "B+":    
                     CGPA+=3.3;
                     break;
                case "B":
                     CGPA+=3.0;
                     break;
                case "B-":
                      CGPA+=2.7;
                      break;
                case "C+":    
                      CGPA+=2.3;
                      break;
                case "C":
                      CGPA+=2.0;
                      break;
                case "C-":
                       CGPA+=1.7;
                       break;            
            }
          }  
          CGPA/=students[i].subjects.length;
          CGPA= CGPA.toFixed(2);
          $("#cgpa").html("CGPA:"+CGPA);
        $("#myModal").modal();
        });
    });
    }
});