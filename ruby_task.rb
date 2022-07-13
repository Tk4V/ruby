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
end

class Flash < Grenade
  def price
    200
  end
end

class MolotovCT < Grenade
  def price
    600
  end
end

class MolotovT < Grenade
  def price
    400
  end
end

class Decoy < Grenade
  def price
    50
  end
end

class Player
  def initialize
    @nades = []
    @user_balance = 800
  end

  def nades
    @nades.map(&:name)
  end

  def buy(nade)
    if @user_balance >= nade.price
      @nades << nade
      @user_balance -= nade.price
      puts @user_balance
    else
      puts "don't have enough money"
    end
  end

  def nades_sum
    @nades.map(&:price).sum
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
