

class Player

def  initialize

end

def make_decision
  # loop until you get a good answer and return

  while true
    print "Would you like to (h)it or (s)tand?"
    answer = gets.chomp.downcase
    if answer[0] == "h"
      return true
    elsif answer[0] == "s"
      return false
    end
    puts "That is not a valid answer!"
  end
end
end
