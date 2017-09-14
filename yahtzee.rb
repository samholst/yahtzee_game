require './scorecard_class.rb'
require './dice_cup_class.rb'
require './player_class.rb'
require 'pry'

class Yahtzee
  def initialize
    @player_class = Player.new
    play_game
    binding.pry
  end

  def play_game
    @player_class.rules
  end
end

Yahtzee.new
