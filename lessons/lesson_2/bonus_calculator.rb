require 'yaml'
require 'pry'
MESSAGE = YAML.load_file('calculator_message.yml')
LANGUAGE = 'cn'

def message(key, lang='en')
  MESSAGE[lang][key]
end

def prompt(key)
  message = message(key, LANGUAGE) || key
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  if integer?(number)
    number = number.to_i
  elsif float?(number)
    number = number.to_f
  else
    false
  end
end

def integer?(input)
  input.match /^\d+$/
end

def float?(input)
  input.match /^\d*\.?\d*$/
end

def operation_to_message(operator)
  word = case operator
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
  word
end

prompt('welcome')
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt("Hello, #{name}")

loop do
  first = ''
  loop do
    prompt('first_number')
    first = Kernel.gets().chomp()
    if first = valid_number?(first)
      break
    else
      prompt('invalid_number')
    end
  end

  second = ''
  loop do
    prompt('second_number')
    second = Kernel.gets().chomp()
    if second = valid_number?(second)
      break
    else
      prompt('invalid_number')
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
    prompt('operator')
    Kernel.puts operator_prompt
    operator = Kernel.gets().chomp()
    if %w(+ - * / % **).include?(operator)
      break
    else
      prompt("Must choose + - x / % **")
    end
  end

  prompt ("#{operation_to_message(operator)} the two numbers ...")

  result = first.send(operator, second)

  prompt ("The calculating result is #{result}")

  prompt('continue?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt('bye')
