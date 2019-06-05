$ALL_FIGHTERS = [] #array.new
class Warrior
	attr_accessor :name, :hp, :mp, :atk, :magic, :status, :speed, :ct
	def initialize(name)
		@name = name
		self.hp = 100
		self.mp = 10
		self.atk = 30
		self.magic = 5
		self.status = 'alive'
		self.speed = 7
		self.ct = 0
		$ALL_FIGHTERS << self
	end
  $wearing = []
  def gear()
    if $wearing.length == 0
      puts "You need armor!"
    end
    puts "Select equipment\n1 - Chest\n2 - Boots\n3 - None"
    ans = gets.chomp.to_i
    if ans == 1
      puts "Select which chestplate you want to put on\n1 - Leather\n2 - Iron\n3 - Chainmail"
      ches = gets.chomp.to_i
      if ans == 1
        puts "You have equipped a Leather Chestplate"
        $wearing << "Leather chestplate"
      elsif ans == 2
        puts "You have equipped an Iron Chestplate"
        $wearing << "Iron chestplate"
      elsif ans == 3
        puts "You have equipped a Chainmail Chestplate"
        $wearing << "Chainmail chestplate"
      else
        puts "You are naked"
      end
    elsif ans == 2
      puts "Select which boots you want to put on\n1 - Leather\n2 - Iron\n3 - Chainmail"
      ches = gets.chomp.to_i
      if ans == 1
        puts "You have equipped Leather boots"
        $wearing << "Leather boots"
      elsif ans == 2
        puts "You have equipped Iron boots"
        $wearing << "Iron boots"
      elsif ans == 3
        puts "You have equipped Chainmail boots"
        $wearing << "Chainmail boots"
      else
        puts "You are barefoot"
      end
    end
  end
		def attack(target)
		target.hp -= self.atk
		puts "#{@name} attacked #{target.name}"
		if target.hp < 1
			target.status = 'fallen'
			$ALL_FIGHTERS.delete(target)
			puts "#{target.name} has fallen!"
		end
	end
end
class Mage
	attr_accessor :name, :hp, :mp, :atk, :magic, :status, :speed, :ct
	def initialize(name)
		@name = name
		self.hp = 60
		self.mp = 100
		self.atk = 10
		self.magic = 40
		self.status = 'alive'
		self.speed = 5
		self.ct = 0 #charge time
		$ALL_FIGHTERS << self
	end
		def cast_spell(target)
		target.hp -= self.magic
		puts "#{@name} casted fire on #{target.name}"
		if target.hp < 1
			target.status = 'fallen'
			$ALL_FIGHTERS.delete(target)
			puts "#{target.name} has burned!"
		end
	end
end
# class Pleb
#   attr_accessor :name, :hp, :mp, :atk, :magic, :status, :speed, :ct
#   def initialize(name)
#     @name = name
#     self.hp = 40
#     self.mp = 5
#     self.atk = 7
#     self.magic = 2
#     self.status = 'alive'
#     self.speed = 3
#     self.ct = 0
#     $ALL_FIGHTERS << self
#   end
#
#   def throw(target)
#     target.hp -= self.atk
#     puts "#{@name} threw a rock at #{target.name}"
#     if target.hp < 1
#       target.status = 'fallen'
#       puts "#{target.name} was stoned to death!"
#     end
#   end
# end
def take_turn(player)
	if player.class == Warrior
		puts "#{player.name}'s turn! Select an Action\n1 - Attack\n2 - Pass\n3 - Quit"
		answer = gets.chomp.to_i #to integer
		if answer == 1
			puts "Who will you attack?"
			$ALL_FIGHTERS.each do |f|
				if f.name == player.name
					puts "Attack yourself"
				else
					puts f.name
				end
			end
			target = gets.chomp.to_i
			if target > ($ALL_FIGHTERS.length - 1)
				puts "You missed!"
			end
			player.attack($ALL_FIGHTERS[target])
		elsif answer == 2
			puts "Skipping turn..."
		elsif answer == 3
			puts "Exiting game"
			$battle_time = false
		else
			puts "Invalid input"
		end
	elsif player.class == Mage
		puts "#{player.name}'s turn! Select an Action\n1 - Cast Spell\n2 - Pass\n3 - Quit"
		answer = gets.chomp.to_i #to integer
		if answer == 1
			puts "Who will you attack?"
			$ALL_FIGHTERS.each do |f|
				if f.name == player.name
					puts "Attack yourself"
				else
					puts f.name
				end
			end
			target = gets.chomp.to_i
			if target > ($ALL_FIGHTERS.length - 1)
				puts "You missed!"
			end
			player.cast_spell($ALL_FIGHTERS[target])
		elsif answer == 2
			puts "Skipping turn..."
		elsif answer == 3
			puts "Exiting game"
			$battle_time = false
		else
			puts "Invalid input"
		end
	else
		puts "Select an Action\n1 - Attack\n2 - Pass\n3 - Quit"
		answer = gets.chomp.to_i #to integer
		if answer == 1

		elsif answer == 2
			puts "Skipping turn..."
		elsif answer == 3
			puts "Exiting game"
			$battle_time = false
		else
			puts "Invalid input"
		end
	end
end
def start_battle(fighters)
	puts "Battle begins!"
	$battle_time = true
	turn_count = 0
	while $battle_time
		fighters.each do |fighter| #block variable. exists only in the block it is defined
			fighter.ct += fighter.speed
			if fighter.ct >= 100
				take_turn(fighter)
				fighter.ct = 0
			end
		end
	end
end

roy = Warrior.new('Roy')
marth = Warrior.new('Marth')
robin = Mage.new('Robin')
start_battle($ALL_FIGHTERS)
