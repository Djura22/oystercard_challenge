# Oystercard class created
class OysterCard
# Card limit set 
	LIMIT = 90
# balance method refactored into attr_reader
  attr_reader :balance
# initializing a balance on the new card. Set at 0
  def initialize
  	@balance = 0
  	#@limit = LIMIT
  end
# method for topping up the owners card balance
  def top_up(amount)
  	fail "Balance limit of #{LIMIT} reached, try smaller amount" if @balance + amount > LIMIT
  	@balance += amount
  end

  def deduct(amount)
  	
    @balance -= amount
  end





	
end