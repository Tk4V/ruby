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
end

he = He.new('He')
flash = Flash.new('flash')
firenadeCT = MolotovCT.new('CTmolotov')
firenadeT = MolotovT.new('Tmolotov')
# dec = Decoy.new('decoy')
# puts Player.new.nades
player2 = Player.new
# p player2.balance_checker
player2.buy(he)
# p player2.balance_residual
player2.buy(flash)
player2.buy(firenadeCT)

# # p player2.nades
# # p player2.nades_sum
# player2.buy(flash)
# # p player2.nades_sum
