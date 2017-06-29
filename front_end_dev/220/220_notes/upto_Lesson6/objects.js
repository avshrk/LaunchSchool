
var invoices = {
  unpaid: [],
  paid: [],
  add: function(name, amount){
    this.unpaid.push({name: name, amount: amount});
  },
  totalAmount: function(collection){
    return collection.reduce(function(total,invoice){
      return total + invoice.amount;
    },0);
  },
  totalDue: function(){
    return this.totalAmount(this.unpaid);
  },
  totalPaid: function(){
    return this.totalAmount(this.paid);
  },
  payInvoice: function(name){
    var tempUnpaid = [];
    this.unpaid.forEach(function(invoice){
      if (name === invoice.name){
        this.paid.push(invoice);
      } else {
        tempUnpaid.push(invoice);
      }
    }, this);

    this.unpaid = tempUnpaid;
  },
};


