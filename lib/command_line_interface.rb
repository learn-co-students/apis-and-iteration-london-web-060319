def welcome
  # puts out a welcome message here!
  puts "Alright, alright, alright"
end

def get_character_from_user
  puts "It would be cooler if you entered a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
  return user_input.downcase
end
