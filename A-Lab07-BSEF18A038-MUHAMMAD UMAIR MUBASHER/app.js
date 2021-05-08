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
    },
    {
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
let app=angular.module("myApp",[]);
app.controller("studentController",function ($scope){
    let studentList=students;
    $scope.studentList=studentList;
    $scope.dropdown=function (event){
        $scope.selectedStudent=event.target.innerHTML;;
        $scope.data=studentList.filter(function (student){
            return student.name===$scope.selectedStudent;
        })[0];
        $scope.showResult=true;
        let CGPA=0.0;
        for(let i=0;i<$scope.data.subjects.length;i++){
            switch ($scope.data.subjects[i].grade)
            {
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
        $scope.CGPA=(CGPA/$scope.data.subjects.length).toFixed(2);
    }
});