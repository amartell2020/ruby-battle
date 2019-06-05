ALL_UNITS = []

class Unit
  attr_accessor :name, :hp, :mp, :speed, :ct, :maxhp, :maxmp, :atk, :status #getter and setter methods
  def initialize(name) #constructor
    self.name = name
    self.hp = 50 #default values line7-14 every object has these by default
    self.mp = 10
    self.atk = 10
    self.speed = 5
    self.ct = 0
    self.maxhp = 50
    self.maxmp = 10
    self.status = 'alive'
    ALL_UNITS << self
  end

  def attack(target) #object method
    puts "#{self.name} attacked #{target.name}"
  end
end

class Squire < Unit #inheritance

  def initialize(name)
    super(name) #function that calls the Superclass's constructor method
  end
#specify unique methods or overwrite methods from parent by using same name
  def throw_stone(target)
    puts "#{self.name} threw a stone ..."
  end
end

class Wizard < Unit
  def initialize(name)
    super(name)
    self.hp -= 10 #alter default values by specifying only what is unique about child object
    self.speed -= 2
    self.mp += 30
  end

  def cast()
    puts "#{self.name} casted magic"
  end
end

class Knight < Unit
  def initialize(name)
    super(name)
    self.hp += 10
    self.atk += 5
    self.mp -= 5
  end

  def rend_armor()
    puts "#{self.name} rended armor! Everything is now rent!"
  end
end

def battle_is_over? #boolean function/method. The "?" is purely for readability. These methods only return true or false
  dead_units = []
  ALL_UNITS.each do |unit|
    if unit.status == 'alive'
      dead_units << false
    else
      dead_units << true
    end
  end
  if dead_units.count(false) > 1
    return false #it is important to remember to return a true or false value in these functions
  end
end

def take_turn(u)
  puts "#{u.name}'s turn! What will you do?"
  puts "1 - Attack\n2 - Special\n3 - Wait"
  choice = gets.chomp.to_i
  case choice #cleaner syntx for an if statement. same as if statement
  when 1
    puts "#{u.name} attacked"
    u.ct -= 25
  when 2
    puts "#{u.name} used a Special move!"
    u.ct -= 50
  when 3
    puts "Waiting ..."
    u.ct -= 10
  else
    puts "INVALID SELECTION"
  end
end

def start_battle
  battle_time = true
  while battle_time
    if battle_is_over?
      break
    end
    ALL_UNITS.each do |unit|
      unit.ct += unit.speed
      sleep 0.1 #sleep will stall execution of the program for n seconds
      puts "#{unit.name}....... #{unit.ct}/100" # #{var} is how you do string interpolation -- MUST HAVE DOUBLE QUOTES
      if unit.ct >= 100
        unit.ct = 100
        take_turn(unit)
      end
    end
  end
end

roy = Knight.new('Roy') #object.new is how we run a class's constructor method
robin = Wizard.new('Robin')
marth = Squire.new('Marth')

start_battle
