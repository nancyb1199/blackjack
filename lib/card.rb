class Card
  VALUES = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
  # Since suits have no importance in blackjack, I have chosen not to use them.
  # SUITS = [:clubs, :diamonds, :hearts, :spades]

  attr_reader :value

  def initialize(value)
    @value = value
  end

end
