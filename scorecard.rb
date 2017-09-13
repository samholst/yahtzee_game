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

  def calculate_score dice_arr, choice
    case choice.downcase
      when "ones"
        one_to_six dice_arr, choice
      when "twos"
        one_to_six dice_arr, choice
      when "threes"
        one_to_six dice_arr, choice
      when "fours"
        one_to_six dice_arr, choice
      when "fives"
        one_to_six dice_arr, choice
      when "sixes"
        one_to_six dice_arr, choice
      when "small straight"
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
        end
      when "large straight"
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
        end
      when "chance"
        if @unused_card.include?("Large Straight")
          @current_score["Chance"] = dice_arr.inject(&:+)
        else
          p "You've already used that scoring category"
        end
			end
  end

  def final_score
  end

  def one_to_six dice_arr, choice
    choice_number = {"Ones" => "1", "Twos" => "2", "Threes" => "3", "Fours" => "4", "Fives" => "5", "Sixes" => "6"}
    if @unused_card.include?("#{choice.capitalize}")
      dice_arr.keep_if { |d| choice_number["#{choice.capitalize}"].match(d.to_s) }
      dice_arr.empty? ? dice_arr = [0] : ''
      @current_score["#{choice.capitalize}"] = dice_arr.inject(&:+)
      @unused_card.delete("#{choice.capitalize}")
    else
      p "You've already used that scoring category"
    end
  end
end


scorecard_class = Scorecard.new
scorecard_class.calculate_score([1,3,4,5,6], "Ones")
scorecard_class.calculate_score([1,3,4,5,6], "Threes")
scorecard_class.calculate_score([2,3,6,5,6], "Small Straight")
scorecard_class.calculate_score([2,3,4,5,6], "Large Straight")
scorecard_class.show_current_score
# 1, 2, 3, 4 | 2, 3, 4, 5

# current_score = Hash.new
# p dice_arr = [2,3,4,5,6]
# p dice_arr.keep_if { |d| /1/.match(d.to_s) }
# p dice_arr.empty? ? dice_arr = [0] : dice_arr
# p current_score["Ones"] = dice_arr.inject(&:+)
# p current_score
