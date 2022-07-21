# frozen_string_literal: true


class Grenade
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def price
    raise 'Not implemented'
  end
end

class He < Grenade
  def price
    300
  end
  def count
    1
  end  
end

class Flash < Grenade
  def price
    200
  end
  def count
    0.5
  end  
end

class MolotovCT < Grenade
  def price
    600
  end
  def count
    1
  end  
end

class MolotovT < Grenade
  def price
    400
  end
  def count
    1
  end  
end

class Decoy < Grenade
  def price
    50
  end
  def count
    1
  end 
end

class Player
  def initialize
    @user_invent_space = 4
    @nades = []
    @user_balance = 3000
  end

  def nades
    @nades.map(&:name)
  end

  def buy(nade)
    @user_invent_space += nade.count
    if @user_invent_space > 8
      abort ("you don't have enough space")
    end  
    if @user_balance >= nade.price
      @nades << nade
      @user_balance -= nade.price
      puts @user_balance
      puts show_cart
    else
      puts "don't have enough money"
    end
  end

  def nades_sum
    @nades.map(&:price).sum
    @nades.map(&:count).sum
  end

  def show_cart
    { nades_sum => nades }
  end

  def buy_nades
    [He, Flash, MolotovCT, MolotovT, Decoy].each do |klass|
      buy(klass.new(klass.name))
    end
  end
end
p = Player.new
p.buy_nades



