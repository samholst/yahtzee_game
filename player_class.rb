class Player
  attr_accessor :player_scorecard, :player_dicecup

  def initialize
    @player_scorecard = Scorecard.new
    @player_dicecup = DiceCup.new
  end

  def rules
    system('clear')

    puts "\nWhether you play the regular game on paper or you play Yahtzee online, the scoring combinations for Yahtzee always include:"

    puts "\n*** Five of a Kind ***\n  If all five dice show the same value, you get 50 points. This is known as a 'Yahtzee'."

    puts "\n*** Chance ***\n  You can use this score combination when you end up with random numbers that don't match any of the other score combinations."

    puts "\n*** Large Straight ***\n  This is five dice in a sequence. Example: 2,3,4,5,6."

    puts "\n*** Small Straight ***\n  This is four dice in a sequence. Example: 1,2,3,4,6."

    puts "\n*** Full House ***\n  This is three-of-a-kind plus two-of-a-kind. Example: 4,4,2,2,2."

    puts "\n*** 4 of a Kind ***\n  This is four of the same number. Example: 3,3,3,3,1."

    puts "\n*** 3 of a Kind ***\n   This is three of the same number. Other than Chance, this is the easiest scoring combination to get."

    puts "\n\nEach score combination can be used only once during the game."

    puts "\nYou can also earn points using the upper section. \nFor example, if you have already claimed the \"4 of a Kind\" but then roll \"3,3,3,3,6\" you can still get points by clicking the \"3\" die in the upper section of the game."

    puts "\nIn this case you would earn 3 x 4 = 12 points. If you score a total of at least 63 points in the upper section, a bonus of 35 points is added to your score.\n\n"
  end
end
