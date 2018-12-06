class Zoo
  attr_reader :cages, :employees

  def initialize(name, season_start, season_close)
    @name
    @season_start = season_start
    @season_close = season_close
    @cages = []
    10.times do
      @cages.push(Cage.new)
    end
    @employees = []
  end

  def add_employee(emp)
    @employees.push(emp)
  end

  def open?(date)
    date >= @season_start && date <= @season_close
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    "Your zoo is already at capacity!"
  end

  # We didn't get to this in marathon
  def visit
    greetings = ""
    @employees.each do |employee|
      greetings << "#{employee.name} waved hello!\n"
    end
    @cages.each do |cage|
      if !cage.animal.nil?
        greetings << cage.animal.speak + "\n"
      end
    end
    greetings
  end
end
