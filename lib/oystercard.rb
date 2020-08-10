# Oystercard class created
class OysterCard
# balance method refactored into attr_reader
  attr_reader :balance
# initializing a balance on the new card. Set at 0
  def initialize
  	@balance = 0
  end
# method for topping up the owners card balance
  def top_up(amount)
  	@balance += amount
  end


	
end