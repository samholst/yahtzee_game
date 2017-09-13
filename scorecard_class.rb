require 'pry'

class Scorecard
  SCORECARD = { "Ones" => 0,
    						"Twos" => 0,
                "Threes" => 0,
                "Fours" => 0,
                "Fives" => 0,
                "Sixes" => 0,
    						"3 of a kind" => 0,
                "4 of a kind" => 0,
                "Full House" => 25,
                "Small Straight" => 30,
                "Large Straight" => 40,
                "Yahtzee" => 50,
                "Chance" => 0
    }

  def initialize
    @unused_card = SCORECARD
    @current_score = Hash.new
  end

  def show_unused
    print @unused_card.keys
  end

  def show_current_score
    print @current_score
  end
  
  def decide_what_to_do_bitch 
    puts "Please make a decision. Here's what you can choose from:"
    show_unused
    puts "Type in what you want:"
    @user_input = gets.chomp.capitalize
  end

  def calculate_score dice_arr, choice
    case choice
      when "Ones"
        one_to_six dice_arr, choice
      when "Twos"
        one_to_six dice_arr, choice
      when "Threes"
        one_to_six dice_arr, choice
      when "Fours"
        one_to_six dice_arr, choice
      when "Fives"
        one_to_six dice_arr, choice
      when "Sixes"
        one_to_six dice_arr, choice
      when "Small straight"
        if @unused_card.include?("Small Straight")
          dice_arr.sort!
          dice_arr = dice_arr.uniq
          small_straights = [[1,2,3,4],[2,3,4,5],[3,4,5,6]]
          straight = false

          small_straights.each do |straight_pair|
            (straight_pair - dice_arr).empty? ? straight = true : ''
          end

          @current_score["Small Straight"] = straight ? 30 : 0
          @unused_card.delete("Small Straight")
        else
          p "You've already used that scoring category"
          decide_what_to_do_bitch 
        end
      when "Large straight"
        if @unused_card.include?("Large Straight")
          dice_arr.sort!
          dice_arr = dice_arr.uniq
          large_straights = [[1,2,3,4,5],[2,3,4,5,6]]
          straight = false

          large_straights.each do |straight_pair|
            (straight_pair - dice_arr).empty? ? straight = true : ''
          end

          @current_score["Large Straight"] = straight ? 40 : 0
          @unused_card.delete("Large Straight")
        else
          p "You've already used that scoring category"
          decide_what_to_do_bitch 
        end
      when "Chance"
        if @unused_card.include?("Large Straight")
          @current_score["Chance"] = dice_arr.inject(&:+)
        else
          p "You've already used that scoring category"
          decide_what_to_do_bitch 
        end
  		when "Full house"
      	check dice_arr
        dice_arr.keep_if {@counts.key(2) && @counts.key(3) }
        @current_score["Full House"] = 25
        @unused_card.delete("Full House")
      when "Four of a kind"
      	check dice_arr
        dice_arr.keep_if { @counts.key(4) }
        @current_score["4 of a kind"] = dice_arr.inject(&:+)
        @unused_card.delete("4 of a kind")
      when "Three of a kind"
      	check dice_arr
        dice_arr.keep_if { @counts.key(3) }
        @current_score["3 of a kind"] = dice_arr.inject(&:+)
        @unused_card.delete("3 of a kind")
      when "Yahtzee"
      	check dice_arr
        dice_arr.keep_if { @counts.key(5) }
        @current_score["Yahtzee"] = 50
        @unused_card.delete("Yahtzee")
    	end
  end

  def final_score
    p "Current Score is: " + "#{@current_score.values.inject(&:+)}"
  end

  def one_to_six dice_arr, choice
    choice_number = {"Ones" => "1", "Twos" => "2", "Threes" => "3", "Fours" => "4", "Fives" => "5", "Sixes" => "6"}
    if @unused_card.include?("#{choice.capitalize}")
      dice_arr.keep_if { |d| choice_number["#{choice.capitalize}"].match(d.to_s) }
      dice_arr.empty? ? dice_arr = [0] : ''
      @current_score["#{choice.capitalize}"] = dice_arr.inject(&:+)
      @unused_card.delete("#{choice.capitalize}")
    else
      print "You've already used that scoring category"
      decide_what_to_do_bitch 
    end
  end
  
  def check dice_arr
    @counts = {}

    dice_arr.each do |number|
      count = dice_arr.find_all { |x| x == number }.size
      @counts[number] = count if count > 1
      end
    end
end

scorecard_class = Scorecard.new
# scorecard_class.calculate_score([1,3,4,5,6], "Ones")
# scorecard_class.calculate_score([1,3,4,5,6], "Threes")
scorecard_class.calculate_score([4,3,6,5,6], "Small straight")
scorecard_class.calculate_score([2,3,4,5,6], "Large straight")
scorecard_class.calculate_score([2,2,2,6,6], "Full house")
# scorecard_class.calculate_score([2,2,2,5,6], "Three of a kind")
# scorecard_class.calculate_score([2,2,2,2,6], "Four of a kind")
# scorecard_class.calculate_score([2,2,2,2,2], "Yahtzee")
scorecard_class.show_current_score
scorecard_class.final_score