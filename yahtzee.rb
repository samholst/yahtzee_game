class Yahtzee

  def initialize
    @player_scorecard = Scorecard.new
    @player_dicecup = DiceCup.new
    system('clear')
    @player_class = Player.new
    play_game
  end

  def play_game 
    @player_class.rules
    puts "Would you like to play?"
    player_choice = gets.chomp.downcase
    if "yes"
      13.times do
      @dicecup = @player_dicecup.first_roll
      @player_scorecard.decide_what_to_do_bitch
      @player_scorecard.calculate_score @dice_arr, @user_input
      end
      @player_scorecard.final_score
    else
      p "Good! We don't wanna play with you either."
      exit
    end
  end
end

Yahtzee.new

