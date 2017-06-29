var invoices = {
  unpaid : [],
  paid : [],
  add : function(name, amount){
    this.unpaid.push({
      name: name,
      amount: amount
    });
  },
  payInvoice: function(clientName){
    var unpaid = [];

    this.unpaid.forEach(function(invoice){
      if (clientName === invoice.name) {
        this.paid.push(invoice);
      } else {
        this.unpaid.push(invoice);
      }
      return this.unpaid;
    });
    if (paidLength === this.paid.length){
      unmached.push(clientName);
    }
  },
  totalDue : function(){
    return this.unpaid.reduce(function(total, invoice){
      total += invoice.amount;
      return total;
    },0);
  },
};

invoices.add('Due North Development',250);
invoices.add('Moonbean Interactive', 187.50);
invoices.add('Slough Digital', 300);
console.log(invoices.totalDue());
