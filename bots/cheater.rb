#
# Cheater, always wins!
# 
# Created by Magnus Holm <judofyr@gmail.com>
# 

class RPS::Round
  alias old_execute execute
  def execute
    if me = [first_player, second_player].detect { |player| player.is_a?(Cheater) }
      @winner = me
    else
      old_execute
    end
  end
end

class Cheater
  include RPS::Bot
  
  def next
    moves.first
  end
end