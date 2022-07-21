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
