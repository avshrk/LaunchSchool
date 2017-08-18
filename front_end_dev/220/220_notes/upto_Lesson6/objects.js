var invoices = {
  unpaid: [],
  paid: [],
  add: function(name, amount){
    this.unpaid.push({
      name: name,
      amount: amount
    });
  },
  totalDue: function(){
    return this.getTotal(this.unpaid);
  },
  totalPaid: function(){
    return this.getTotal(this.paid);
  },
  getTotal: function(collection){
    return collection.reduce(function(total,invoice){
      return total + invoice.amount;
    },0);
  },
  payInvoice: function(name){
    var temp_unpaid = [];
    this.unpaid.forEach(function(invoice){
      if (invoice.name === name){
        this.paid.push(invoice);
      } else {
        temp_unpaid.push(invoice);
      }
    },this);
    this.unpaid = temp_unpaid;
  },
};

