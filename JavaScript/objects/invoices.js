var invoices = {
  unpaid: [],
  paid: [],
};

invoices.add = function (name, amount) {
  this.unpaid.push({
    name: name,
    amount: amount
  });
};

invoices.totalDue = function (){
  var total = 0;
  this.unpaid.forEach(function(item){
    total += item.amount;
  });
  return total;
};

invoices.payInvoice = function(name){
  var tempUnpaid = [];
  for (i=0; i < this.unpaid.length; i++){
    if (this.unpaid[i].name === name){
      this.paid.push(this.unpaid[i]);
    } else {
      tempUnpaid.push(this.unpaid[i]);
    }
  }
  this.unpaid = tempUnpaid;
};

invoices.totalPaid = function(){
  var total = 0;
  this.paid.forEach(function(item){
    total += item.amount;
  });
  return total;
};

invoices.add('Due',250);
invoices.add('Moon',187.50);
invoices.add('Slough',300);
console.log(invoices.totalDue());
invoices.payInvoice('Due');
invoices.payInvoice('Slough');
console.log(invoices.unpaid);
console.log(invoices.paid);
console.log(invoices.totalDue());
console.log(invoices.totalPaid());
