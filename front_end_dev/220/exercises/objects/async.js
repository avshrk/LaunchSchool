addEventListener('mousemove', function(event) {
  var x = document.querySelector('.x');
  x.style.left = event.clientX.toString() + 'px';
  x.style.top = event.clientY.toString() + 'px';
});

document.addEventListener('keyup', function(event) {
  var key = event.which;
  var color;

  if (key === 82) {
    color = 'red';
  } else if (key === 71) {
    color = 'green';
  } else if (key === 66) {
    color = 'blue';
  }

  if (color) {
    var x = document.querySelector('.x');
    for (var i = 0; i < x.children.length; i++) {
      var child = x.children[i];
      child.style.background = color;
    }
  }
});
