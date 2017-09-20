require_relative "card"

class Hand

attr_accessor :cards, :hand_value, :winner

def initialize
  @cards = []
  @hand_value = 0
  @winner = false
  @ace_in_hand = false
end

def calculate_score(hand)
  @hand_value = 0
  @ace_in_hand = false
  hand.cards.each do |card|
    if card.value == "A"
      @ace_in_hand = true
      @hand_value +=1
    elsif (card.value == "J" || card.value == "Q" || card.value == "K")
      @hand_value += 10
    else
      @hand_value += card.value
    end # if stmt
  end # do
  if @ace_in_hand
    if (@hand_value + 10) > 21
      # do nothing because making one Ace 11 would bust
    else
      @hand_value += 10
    end
  end

  return @hand_value
end # calculate_score


end #class
