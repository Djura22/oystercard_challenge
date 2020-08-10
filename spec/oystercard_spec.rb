require 'oystercard'
# recognise the oystercard file
describe OysterCard do 

# Checking new card has 0 balance
  it 'Balance of new card is zero' do
  	expect(subject.balance).to eq(0)
  end
# Checking that a new card instance can talk to a top-up method with a sgl arg.
  it { is_expected.to respond_to(:top_up).with(1).argument }

  it { is_expected.to respond_to(:deduct).with(1).argument }

  describe 'top_up' do

    it 'top up to update balance of Oyster' do
    	expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'Balance should not exceed 90' do
    	full_balance = OysterCard::LIMIT
    	subject.top_up full_balance 
    	expect { subject.top_up 1 }.to raise_error "Balance limit of #{full_balance} reached, try smaller amount"
    end
  end

  describe 'deduct' do

  	it 'deduct from balance' do
  	  subject.top_up(1)
  		expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
  	end

  	it 'prevents use of card at 0 balance' do
  		card = OysterCard.new
  		subject.top_up(1)
  		expect { card.deduct 1 }.to raise_error "Time to top up! Balance: 0"
  	end
  end


end

