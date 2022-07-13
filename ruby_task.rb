class Grenade
	attr_accessor :name
	
	def initialize(name) 
		@name = name
	end

	def price
		raise "Not implemented"
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

class Player


	def initialize
		@nades =[]
	end	

	def nades
		@nades.map(&:name)
	end

	def buy(nade)
		@nades << nade
	end

	def nades_sum
		@nades.map(&:price).sum
	end

	def show_cart
		{nades_sum => nades}
	end	
end	

he = He.new("He")
flash = Flash.new("flash")
puts Player.new.nades
player2 = Player.new
player2.buy(he)
player2.buy(flash)
#p player2.nades
#p player2.nades_sum
player2.buy(flash)
#p player2.nades_sum
puts player2.show_cart
