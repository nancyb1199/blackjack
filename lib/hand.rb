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
      # keep track of the fact that this hand has at least one Ace and for now
      # just add one for each Ace
      @ace_in_hand = true
      @hand_value +=1
    elsif (card.value == "J" || card.value == "Q" || card.value == "K")
      @hand_value += 10
    else
      @hand_value += card.value
    end # if stmt
  end # do
  # If we have at least one Ace in the hand, check if we can bump it's value
  # up from 1 to 11 without busting. You'll never count more than one Ace
  # as 11 since that would always make you bust
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
