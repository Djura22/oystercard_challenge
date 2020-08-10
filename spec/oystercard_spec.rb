require 'oystercard'
# recognise the oystercard file
describe OysterCard do 
# In order to use public transport
# As a customer
# I want money on my card

# Checking new card has 0 balance
  it 'Balance of new card is zero' do
  	expect(subject.balance).to eq(0)
  end
# Checking that a new card instance can talk to a top-up method with a sgl arg.
  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe 'top_up' do

    it 'receives input balance correctly' do
    	expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end


  end


end

