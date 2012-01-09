class Player
  
  def play_turn(warrior)
    
    done = false
    
    if shouldIPivot?(warrior.look(:forward), warrior.look(:backward))  || warrior.feel.wall? == true && !done
      warrior.pivot!
      done = true
    end
    
    if shouldIShoot?(warrior.look(:forward)) && !done
      warrior.shoot!
      done = true
    end
    
    if shouldIAttack?(warrior.look(:forward)) && !done
      warrior.attack!
      done = true
    end

    if warrior.health < 20 && !done
      warrior.rest!
      done = true
    end
    
    if warrior.feel.captive? && !done
      warrior.rescue!
      done = true
    end
    
    if !done
      warrior.walk!
      done = true
    end
    
  end
  
  def shouldIPivot? (lookFrontArray, lookBackArray)
    
    pivot = false
    wizardInBack = false
    wizardInFront = false
    archerInBack = false
    archerInFront = false
    
    wizardInBack = true if lookBackArray.fetch(0).to_s == 'Wizard' || lookBackArray.fetch(1).to_s == 'Wizard'
    wizardInFront = true if lookFrontArray.fetch(0).to_s == 'Wizard' || lookFrontArray.fetch(1).to_s == 'Wizard'
    archerInBack = true if lookBackArray.fetch(0).to_s == 'Archer' || lookBackArray.fetch(1).to_s == 'Archer' || lookBackArray.fetch(2).to_s == 'Archer'
    archerInFront = true if lookFrontArray.fetch(0).to_s == 'Archer' || lookFrontArray.fetch(1).to_s == 'Archer' || lookFrontArray.fetch(2).to_s == 'Archer'
    
    pivot = true if wizardInBack || archerInBack
    
    return pivot
  end

  def shouldIShoot? (lookFrontArray)
    shoot = false

    shoot = true if lookFrontArray.fetch(1).enemy? == true || lookFrontArray.fetch(2).enemy? == true

    return shoot
  end
  
  def shouldIAttack? (lookFrontArray)
    attack = false
    
    attack = true if lookFrontArray.fetch(0).enemy? == true
    
    return attack
    
  end
    
  
end
