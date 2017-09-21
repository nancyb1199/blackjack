
require_relative "deck"
require_relative "hand"
require_relative "player"

class Dealer


def initialize
  # puts "hello dealer"
  @deck = Deck.new
  @player_hand = Hand.new
  @dealer_hand = Hand.new
  @player_pot = 100
end

# To start a game we will shuffle the deck and
# deal two cards to each player from the new deck
def start_game
  @deck.shuffle
  2.times{@player_hand.cards << @deck.draw}
  2.times{@dealer_hand.cards << @deck.draw}
  puts "You have $#{@player_pot} and you bet $10 "
  game_loop
end


def game_loop
  @player_hand.calculate_score(@player_hand)
  if @player_hand.hand_value == 21
      print "You have the following cards: "
      @player_hand.cards.each do |card|
        print "#{card.value} "
      end
      @player_hand.winner = true
      end_game
    elsif @player_hand.hand_value > 21
      print "Player Busts!"
      @dealer_hand.winner = true
      end_game
    else prompt_player
  end
end

def prompt_player
  print "You have the following cards: "
  @player_hand.cards.each do |card|
    print "#{card.value} "
  end
  puts "Your card total is #{@player_hand.hand_value} "
  if get_hit_or_stand
    @player_hand.cards << @deck.draw
    game_loop
  else
    check_dealer
  end
end

def check_dealer
  print "Dealer has the following cards: "
  @dealer_hand.cards.each do |card|
    print "#{card.value} "
  end
  @dealer_hand.calculate_score(@dealer_hand)
  puts "Dealer total is #{@dealer_hand.hand_value} "
  while @dealer_hand.hand_value < 17
    puts "Dealer hits"
    @dealer_hand.cards << @deck.draw
    @dealer_hand.cards.each do |card|
      print "#{card.value} "
    end
    @dealer_hand.calculate_score(@dealer_hand)
    puts "Dealer total is #{@dealer_hand.hand_value} "
  end
  if @dealer_hand.hand_value > 21
    print "Dealer Busts!"
    @player_hand.winner = true
  elsif @dealer_hand.hand_value < @player_hand.hand_value
    @player_hand.winner = true
  elsif @dealer_hand.hand_value > @player_hand.hand_value
    @dealer_hand.winner = true
  else
    # I think a tie goes to the Player!
    puts "It's a tie!"
    @player_hand.winner = true
  end
  end_game
end

def get_hit_or_stand
  # loop until you get a good answer and return
  while true
    print "Would you like to (h)it or (s)tand? "
    answer = gets.chomp.downcase
    if answer[0] == "h"
      return true
    elsif answer[0] == "s"
      return false
    end
    puts "That is not a valid option!"
  end
end

def end_game
  if @player_hand.winner == true
    puts "Player wins!"
    @player_pot += 10
  else
    puts "Dealer wins!"
    @player_pot -= 10
  end
  puts " -------------------------------------------------------------------- "
  if get_play_again
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    start_game
  else
    puts "Thanks for playing! You ended with $#{@player_pot}"
  end
end

def get_play_again
  while true
    print "Would you like to play again? Please enter (y)es or (n)o "
    answer = gets.chomp.downcase
    if answer[0] == "y"
      return true
    elsif answer[0] == "n"
      return false
    end
  puts "That is not a valid option!"
  end
end

end
