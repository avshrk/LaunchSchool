
document.addEventListener('DOMContentLoaded',function(){
  var answer, guessCount;
  var input = document.querySelector('#guess');
  var form = document.querySelector('form');

  function getRandomBetween(min,max){
    return Math.floor(Math.random() * max ) + min;
  }

  function newGame(){
    guessCount = 0;
    answer = getRandomBetween(1,100);
    form.reset();
    updateParag('Guess a number between 1 to 100');
    document.querySelector('[type="submit"]').disabled = false;
  }

  function updateParag(message){
    var parag = document.querySelector('p');
    parag.textContent = message;
  }

  function getMessage(guess){
    if (Number.isNaN(guess)){
      return 'Please enter a number';
    }

    if (guess > answer){
      return  'The number is lower ' + guess ;
    } else if(guess < answer ) {
      return 'The number is higher ' + guess ;
    } else {
      document.querySelector('[type="submit"]').disabled = true;
      return 'You guessed it right. It took ' + guessCount + ' guesses! ';
    }
  }

  newGame();

  form.addEventListener('submit',function(event){
    event.preventDefault();
    var guess = parseInt(input.value, 10);
    var message = getMessage(guess);

    updateParag(message);
    guessCount++;

  });

  var link = document.querySelector('a');
  link.addEventListener('click',function(event){
    newGame();
  });
});
