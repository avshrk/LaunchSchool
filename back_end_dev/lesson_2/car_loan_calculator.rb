
def monthly_rate(annual_rate)
  annual_rate / 1200
end

def loan_duration_months(loan_annual)
  loan_annual * 12
end

def payments(rate, duration, amount)
  amount * (rate * (1 + rate)**duration) / (((1 + rate)**duration) - 1)
end

def prompt(str)
  print "==> " + str
end

def given_loan_amount
  loan_amount = ''
  prompt('Enter loan amount (without $ sign or comma) : ')

  loop do
    loan_amount = gets.chomp.to_f

    break if loan_amount > 0
    prompt('Invalid amount, Enter a value larger than 0 : ')
  end
  loan_amount
end

def given_annual_rate
  annual_rate = 0
  prompt('Enter annual interest rate (6% as 6 without percent sign) : ')

  loop do
    annual_rate = gets.chomp.to_f

    break if annual_rate > 0
    prompt("Invalid Rate, Enter a value larger than 0 : ")
  end
  annual_rate
end

def given_loan_duration
  loan_duration = 0

  prompt('Enter loan duration in years: ')
  loop do
    loan_duration = gets.chomp.to_i

    break if loan_duration > 0
    prompt("Invalid Duration, Enter a value larger than 0 : ")
  end
  loan_duration
end

def continue?
  prompt('Enter y to continue, any key to quit: ')
  answer = gets.chomp[0].downcase
  answer.start_with?('y')
end

def car_loan_calculator
  prompt("Car Loan Calculator\n")

  loop do
    loan_amount = given_loan_amount
    annual_rate = given_annual_rate
    monthly_rate = monthly_rate(annual_rate)
    loan_duration = given_loan_duration
    loan_months = loan_duration_months(loan_duration)

    prompt("Your monthly payment: " + payments(monthly_rate, loan_months, loan_amount).round(2).to_s + "\n")

    break unless continue?
  end
end
car_loan_calculator
