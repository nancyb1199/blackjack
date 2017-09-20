require_relative "card"

class Hand

attr_accessor :cards, :hand_value, :winner

def initialize
  @cards = []
  @hand_value = 0
  @winner = false
  @ace_count = 0
  @ace_is_eleven = false
end

def calculate_score(hand)
  @hand_value = 0
  hand.cards.each do |card|
    if card.value == "A"
      @ace_count += 1
      @ace_is_eleven = true if @ace_count == 1
      check_ace
    elsif (card.value == "J" || card.value == "Q" || card.value == "K")
      @hand_value += 10
    else
      @hand_value += card.value
    end # if stmt
  end # do
  if @hand_value > 21 && @ace_is_eleven
    @hand_value -= 10
    @ace_is_eleven = false
  end

  return @hand_value
end # calculate_score

def check_ace
  if @ace_count == 1 && ((@hand_value + 11) > 21)
    @hand_value += 1
  elsif @ace_count > 1
    @hand_value += 1
  else
    @hand_value += 11
  end # if stmt

end # check_ace

end #class
