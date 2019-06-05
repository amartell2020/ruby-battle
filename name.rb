# class User
#   attr_writer :name, :email #can change these methods
#   attr_reader :name, :email #can display these methods
#   def initialize(name, email)
#     @name = name #@ makes it an instance variable. local variables have no symbol. exist within scope they are defined. @@ is a class variable accessed throughout class definition.
#     @email = email #instance variable is a variable that when used within an object, its value corresponds to the value at that instance
#   end
# end
#
# user = User.new('alex', 'alex@example.com')
# user2 = User.new('billy', 'billy@example.com')
# user.name = 'Alex'
# puts user.name
# puts user2.name

$all_users = Array.new

class User
  def initialize(name)
    @name = name
    $all_users << self
  end

  def name
    @name
  end


end

user = User.new('Alex')
user2 = User.new('Billy')
puts user.name
puts $all_users
