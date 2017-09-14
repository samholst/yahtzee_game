require './scorecard_class.rb'
require './dice_cup_class.rb'
require './player_class.rb'
require 'pry'

class Yahtzee
  def initialize
    system('clear')
    @player_class = Player.new
    play_game
  end

  def play_game
    @player_class.rules
    puts "Would you like to play?"
    player_choice = gets.chomp.downcase
    if player_choice == "yes"
      13.times do
        arr = @player_class.player_dicecup.first_roll
        @player_class.player_scorecard.decide_what_to_do arr
        # binding.pry
      end
      @player_class.player_scorecard.final_score
    else
      puts "Good! We don't wanna play with you either."
      exit
    end

  end
end

Yahtzee.new
