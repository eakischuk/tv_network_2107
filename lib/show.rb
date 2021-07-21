class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    total = 0
    @characters.each do |character|
      total += character.salary
    end
    total
  end

  def highest_paid_actor
    highest_paid = @characters.first
    @characters.each do |character|
      if character.salary > highest_paid.salary
        highest_paid = character
      end
    end
    highest_paid.actor
  end

  def actors
    actors = []
    @characters.each do |character|
      actors << character.actor
    end
    actors
  end
end
