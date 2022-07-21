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
    [He, Flash, MolotovCt, MolotovT, Decoy].each do |klass|
      buy(klass.new(klass.name))
    end
  end
end