require 'rubocop'

def prompt(words)
  Kernel.puts("=> #{words}")
end

def get_input
  Kernel.gets().chomp()
end

def ask_name
  name = get_input
  if name.empty?
    name = "Mystery"
  end
  name = "Mr/Miss #{name}"
end

def ask_loan_amount
  prompt("How much is your total loan amount?")
  loan_amount = get_input
  if loan_amount = valid_number?(loan_amount)
    return loan_amount
  else
    ask_loan_amount
  end
end

def ask_annual_rate
  prompt("How many is your **Annual Percentage Rate**?(No need for % sign, for \
example 18 would be treated as 18%)")
  annual_rate = get_input
  if annual_rate = valid_number?(annual_rate)
    return annual_rate = annual_rate.to_f / 100
  else
    ask_annual_rate
  end
end

def ask_loan_duration
  prompt("How long is your loan duration in years?")
  prompt("(Half a year is the acceptive minimal duration, for example: 3.5 \
represents 3 year 6 months)")
  duration_in_years = get_input
  if duration_in_years = valid_number?(duration_in_years)
    return duration_in_years
  else
    ask_loan_duration
  end
end

def valid_number?(number)
  if number.match(/^\d+$/)
    number = number.to_f
  elsif number.match(/^\d+\.\d+$/)
    number.to_f
  else
    prompt("It seems an invalid number, please enter an integer or a float.")
  end
end

prompt("Hello, welcome to mortgage calculator. May ask for your name?: ")

name = ask_name

prompt("Hi, #{name}")

loop do
  loan_amount = ask_loan_amount

  annual_rate = ask_annual_rate

  monthly_intrest_rate = annual_rate / 12

  loan_duration = ask_loan_duration

  duration_in_months = (loan_duration * 12).to_i

  monthly_pay = loan_amount * (monthly_intrest_rate / (1 - (1 + monthly_intrest_rate)**(-duration_in_months))).round(2)

  prompt("Your monthly interest rate is #{monthly_intrest_rate}. You have to pay \
$#{monthly_pay} every month.")
  answer = ''
  prompt("Would you want to begin another calculation? (Answer y to continue)")
  answer = get_input.downcase
  if answer != 'y'
    prompt("Bye")
    break
  end
end
