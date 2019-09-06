function isValidEmail(email) {
  var local;
  var domainParts;

  if (email.split('@').length !== 2) return false;

  local = email.split('@')[0];
  if (local.search(/[^a-zA-Z0-9]/) > -1) return false;

  domainParts = email.split('@')[1].split('.');
  if (domainParts.length < 2 ) return false;

  for (var i = 0; i < domainParts.length; i++) {
    if (domainParts[i].search(/[a-zA-Z]/) < 0 || domainParts[i].search(/[^a-zA-Z]/) > 0) return false;
  }

  return true;
}

var r ;

r = isValidEmail('Foo@baz.com.ph');          // returns true
console.log(r);
r = isValidEmail('Foo@mx.baz.com.ph');       // returns true
console.log(r);
r = isValidEmail('foo@baz.com');             // returns true
console.log(r);
r = isValidEmail('foo@baz.ph');              // returns true
console.log(r);
r = isValidEmail('HELLO123@baz');            // returns false
console.log(r);
r = isValidEmail('foo.bar@baz.to');          // returns false
console.log(r);
r = isValidEmail('foo@baz.');                // returns false
console.log(r);
r = isValidEmail('foo_bat@baz');             // returns false
console.log(r);
r = isValidEmail('foo@bar.a12');             // returns false
console.log(r);
r = isValidEmail('foo_bar@baz.com');         // returns false
console.log(r);
r = isValidEmail('foo@bar.....com');         // returns false
console.log(r);
