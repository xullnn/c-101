class OrangeTree
  def initialize
    @age = 0
    @height = 0.5
    @alive = true
    @number_of_fruits = 0
  end

  def age
    @age
  end

  def age=(age)
    @age = age
    if age >= 100
      @alive = false
    end
  end

  def height
    @height
  end

  def die?
    !@alive
  end

  def immature_tree?
    @age <= 3
  end

  def mature_tree?
    @age > 3 && @age < 100
  end

  def old_tree?
    @age >= 100
  end

  def one_year_passes
    @age += 1
    if immature_tree?
      @height += 3
    elsif mature_tree?
      @height += 2
      @number_of_fruits = 100
    elsif old_tree?
      @height += 1
      @number_of_fruits = 60
    elsif @age >= 110
      @alvie = false
    end
    puts "Now your tree is #{@age} years old, #{@height} meters high, and has #{@number_of_fruits} oranges on it."
  end

  def count_the_oranges
    @number_of_fruits
  end

  def pick_oranges(number)
    if number <= @number_of_fruits
      puts "You picked #{number} oranges from the tree."
      @number_of_fruits -= number
    else
      puts "There is not so many oranges on the tree, try picking less."
    end
    puts "Currently we have #{@number_of_fruits} on the tree."
  end
end
