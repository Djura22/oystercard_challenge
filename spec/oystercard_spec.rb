require 'oystercard'
# recognise the oystercard file
describe Oystercard do 
# In order to use public transport
# As a customer
# I want money on my card

# Checking new card has 0 balance
  it 'Balance of new card as zero' do
  	expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }







end

