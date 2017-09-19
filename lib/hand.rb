require_relative "card"

class Hand

attr_accessor :cards, :hand_value, :winner

def initialize
  @cards = []
  @hand_value = 0
  @winner = false
  @ace_is_eleven = false
end

def calculate_score(hand)
  @hand_value = 0
  hand.cards.each do |card|
    if card.value == "A"
      check_ace
    elsif (card.value == "J" || card.value == "Q" || card.value == "K")
      @hand_value += 10
    else
      @hand_value += card.value
    end # if stmt
    # check_ace
  end # do
  return @hand_value
end # calculate_score

def check_ace
  if @ace_is_eleven
    # no aces, nothing to do here
  elsif @hand_value <= 10
      @ace_is_eleven = true
      @hand_value += 11
    else
      @hand_value += 1
  end # if stmt

end # check_ace

end #class
