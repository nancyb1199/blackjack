require_relative "card"

class Deck

  def initialize
    @cards = []
    4.times do
      Card::VALUES.each do |value|
        @cards.push(Card.new(value))
      end
    end
    # puts @cards.length
  end

  def cards_left
    @cards.length
  end

  def draw
    @cards.shift
  end

  def shuffle
    @cards.shuffle!
  end
end
