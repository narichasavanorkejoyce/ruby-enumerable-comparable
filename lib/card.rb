# frozen_string_literal: true

# A simple representation of a playing card.
# We are writing a custom class
class Card
  SUITS = %w[C D H S].freeze
  RANKS = [(2..10).to_a, %w[J Q K A]].flatten.freeze

  attr_reader :suit, :rank
  include Comparable

  # <=> here is basically defining a method
  def <=>(other)
    # then, we're going to compare the index numbers
    suit_comparison = SUITS.index(suit) <=> SUITS.index(other.suit)
    rank_comparison = RANKS.index(rank) <=> RANKS.index(other.rank)
  end

  if suit_comparison.zero?
    rank_comparison
  else
    suit_comparison
  end

  def initialize(rank, suit)
    unless SUITS.include? suit
      raise ArgumentError, "Suit: '#{suit}' not in #{SUITS}"
    end
    unless RANKS.include? rank
      raise ArgumentError, "Rank: '#{rank}' not in #{RANKS}"
    end

    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank}:#{suit}"
  end
end
