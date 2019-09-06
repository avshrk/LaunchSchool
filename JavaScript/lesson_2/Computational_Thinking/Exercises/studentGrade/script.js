function studentGrade() {
  var gradeCount = 1 ;
  var grades = [] ;
  var total = 0 ;
  var average ;
  var letterGrade ;

  while ( gradeCount < 4 ){
    var grade;
    grade = prompt("Enter a grade:");
    grades.push(parseInt(grade,10))
    gradeCount++;
  }

  for (var i = 0; i < grades.length; i++){
    total += grades[i];
  }

  average = total / grades.length;

  switch (true) {
    case average >= 90 :
      letterGrade = 'A';
      break;
    case average >= 70 && average < 90 :
      letterGrade = 'B';
      break;
    case average >= 50 && average < 70 :
      letterGrade = 'C';
      break;
    default:
      letterGrade = 'F';
  }

  console.log('Your letter grade is :' + letterGrade );
}

studentGrade();


