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

 def balance_checker
 	if @user_balance > nades_sum
 		puts "confirmed purschase"
 	elsif @user_balance < nades_sum 
 		abort "don't have enough money"	
 	end				
 end	

  def buy(nade)
    @nades << nade
  end

  def balance_residual 		
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
molotovCt = MolotovCT.new('molotovCt')
molotovT = MolotovT.new('molotovT')
decoy = Decoy.new('decoy')
puts Player.new.nades
player2 = Player.new
puts player2.balance_checker
player2.buy(he)
player2.buy(flash)
# p player2.nades
# p player2.nades_sum
player2.buy(flash)
# p player2.nades_sum



