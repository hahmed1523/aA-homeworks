class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1 
    @name2 = name2 
    @cups = Array.new(14){[]}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length-1).each {|idx| 4.times {@cups[idx] << :stone} if idx != 6}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos >= @cups.length 
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    #empty cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    #distribute stones
    cup_idx = start_pos 
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      #place stone in the correct current players cup
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop 
      end
    end

  render

  next_turn (cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch 
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    player_1_total = @cups[6].count 
    player_2_total = @cups[13].count 
    if player_1_total == player_2_total
      return :draw 
    else
      if player_1_total > player_2_total
        return @name1 
      else
        return @name2 
      end
    end
  end
end
