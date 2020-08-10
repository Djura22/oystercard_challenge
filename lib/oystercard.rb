# Oystercard class created
class OysterCard
# balance method refactored into attr_reader
  attr_reader :balance
# initializing a balance on the new card. Set at 0
  def initialize
  	@balance = 0
  end

  def top_up(amount)
  end


	
end