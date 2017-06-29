
var intervalID ;
var inputTextField ;

document.addEventListener('DOMContentLoaded', function() {
  var textField =  document.querySelector('.text-field');
  inputTextField = textField;

  textField.addEventListener('click',function(event){
    event.stopPropagation();
    textField.classList.add('focused');

    intervalID = setInterval(function(){
      textField.classList.toggle('cursor');
    }, 500);
  });
});

document.addEventListener('keypress', function(event){
  if (inputTextField) {
    var inputContent = inputTextField.querySelector('.content');
    if (event.which === 8 ){
      inputContent.textContent = inputContent.textContent.substr(0,inputContent.length - 1);
    } else if (event.key.length === 1 ){
    inputContent.textContent = inputContent.textContent + event.key;
    }
  }
});

document.addEventListener('click',function(event){
  var textField =  document.querySelector('.text-field');
  clearInterval(intervalID);
  textField.classList.remove('focused', 'cursor');
});


