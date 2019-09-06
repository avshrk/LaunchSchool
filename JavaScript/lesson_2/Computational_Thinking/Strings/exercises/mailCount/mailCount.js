function mailCount(emailData) {
  var output;
  var emailDataList = emailData.split('##||##');

  var dates = emailDataList.map(function(email){
    return new Date(email.split('#/#')[2].split(' ')[1]);
  });

  dates.sort(function(a,b){
    return a - b;
  });

  output = 'Count of emails: ' + dates.length;
  output += '\n';
  output += 'Date range: ' + dates[0].toDateString() + ' - ' + dates[dates.length - 1].toDateString() ;

  return output;
}

console.log(mailCount(emailData));

// console.output
// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016
