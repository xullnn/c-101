def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i() != 0
end

def operation_to_message(operator)
  case operator
  when '+'
    'Add'
  when '-'
    'Subtract'
  when '*'
    'Multiply'
  when '/'
    'Divide'
  when '%'
    'Modulo'
  when '**'
    'Exponent'
  end
end

name = ''
loop do
  prompt("Welcome to Calculator! Enter your name: ")
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello, #{name}")

loop do
  first = ''
  loop do
    prompt("Hello! Please enter your first number:")
    first = Kernel.gets().chomp().to_i
    if valid_number?(first)
      break
    else
      prompt("Hmm... That doesn't look like a valid number.")
    end
  end

  second = ''
  loop do
    prompt("Well, enter the second number:")
    second = Kernel.gets().chomp().to_i
    if valid_number?(second)
      break
    else
      prompt("Hmm... That doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    + --- add
    - --- subtract
    * --- multiply
    / --- divide
    % --- modulo
    ** --- exponent
  MSG

  operator = ''
  loop do
    prompt("Now enter the operation you want to perform#{operator_prompt} ")
    operator = Kernel.gets().chomp()
    if %w(+ - * / % **).include?(operator)
      break
    else
      prompt("Must choose + - x / % **")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers ...")

  result = first.send(operator, second)

  prompt("The calculating result is #{result}")
  prompt("Do you wanna perform another calculation? (Y to start again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt("Thanks you for using calculation. Good bye")
