require 'oystercard'
# recognise the oystercard file
describe Oystercard do 
#In order to use public transport
#As a customer
#I want money on my card
  it 'Balance of new card as zero' do
  	expect(subject.balance).to eq(0)
  end





  
end

