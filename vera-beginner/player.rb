class Player
  def play_turn(warrior)

    if warrior.feel.empty? == true
      warrior.walk! :forward
    end
    
    if warrior.feel.empty? == false
      warrior.attack! :forward
    end

  end
end
