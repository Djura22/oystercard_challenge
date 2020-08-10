# Oystercard class created
class Oystercard
# balance method refactored into attr_reader
  attr_reader :balance
# initializing a balance on the new card. Set at 0
  def initialize
  	@balance = 0
  end
	
end