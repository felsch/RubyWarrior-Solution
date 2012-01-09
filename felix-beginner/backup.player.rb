class Player
  
  @health = nil
  
  def play_turn(warrior)
    
    
    
    if warrior.feel.wall?
      warrior.pivot!
      done = true
    end
    
    if wizcheck(warrior.look) == true && !done
      warrior.shoot!
      done = true
    end
    
    @health = warrior.health unless @health
    
    if @health > warrior.health && warrior.feel.empty? == true && !done
      if warrior.health < 13
          warrior.walk! :backward
        else 
          warrior.walk!
      end
      done = true
    end
    
    if warrior.health < 20 && warrior.feel.empty? == true && !done
      warrior.rest!
      done = true
      rested = true
    end
    
    if warrior.feel.empty? == true && !done
      warrior.walk!
      done = true
    end
    
    if warrior.feel.captive? == true && !done
      warrior.rescue!
      done = true
    end

    if warrior.feel.empty? == false && !done
      warrior.attack!
      done = true
    end
    
    @health = warrior.health
    
  end
  
  def wizcheck (aussicht)
    return true if aussicht.fetch(0).to_s == 'Wizard'
    return true if aussicht.fetch(1).to_s == 'Wizard'
    return true if aussicht.fetch(2).to_s == 'Wizard'
    return false
  end
  
end
