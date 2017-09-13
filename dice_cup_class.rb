class DiceCup


  def first_roll
    @player_hand = []
    @roll_count = 1
    cup = []
    puts "rolling..."
    sleep 2
    5.times { |x| cup << @one_dice = rand(1..6) } 
    keep_dice cup
  end

  def roll number
    puts "rolling...."
    sleep 2
    @roll_count += 1
    cup = []
    number.times { |x| cup << @one_dice = rand(1..6) } 
    cup.each do |x|
      @player_hand << x
    end
    keep_dice @player_hand
  end

  def keep_dice cup
    kept_array = []
    if @roll_count != 3
      puts "This is your cup: #{cup} Enter in the numbers you'd like to keep."
      user_input = gets.chomp.gsub(',', '').split.each { |number| kept_array << number.to_i } 
    end
    @player_hand = kept_array
    if kept_array.length == 5 || @roll_count == 3
      puts "End of round, here is your final cup: #{cup}"
      return cup
    else
      roll 5 - (kept_array.length)
    end
  end
end