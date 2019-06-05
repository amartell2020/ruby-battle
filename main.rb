# def reverse_the_string(string)
#   split_string = string.split("") #split string, empty quotes splits every letter apart. single space would split where there is space.
#   reversed = [] #empty array to put reversed string in.
#   string.size.times { reversed << split_string.pop} #repeat during length of string entered. push popped letter in to reversed array.
#   reversed.join #join elements in reversed array
# end
#
# words = gets.chomp #gets is for input. chomp removes the line break.
#
# print reverse_the_string(words)
#

words = gets.chomp

def rev(string)
  string.reverse
end

print rev(words)
