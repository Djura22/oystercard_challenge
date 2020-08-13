require 'oystercard'

describe Oystercard do

  it "Expects balance to be zero" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq (0)
  end

  it "Expect oystercard to respond to top_up method with an amount" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "Expect oystercard to respond to touch_in method with an argument" do
    expect(subject).to respond_to(:touch_in).with(1).argument
  end

  it "Expect oystercard to respond to touch_out method with an argument" do
    expect(subject).to respond_to(:touch_out).with(1).argument
  end

  describe "#top_up" do
    it "Expects balance to increase by top up amount" do
      amount = 10
      expect{ subject.top_up amount }.to change{ subject.balance }.by 10
    end

    it "Expects error if balance exceeds £90" do
      amount = 100
      expect{ subject.top_up amount }.to raise_error "The maximum limit is: 90"
    end
  end

  describe '#touch_in' do

    let(:station){ double :station }

    context 'card has been touched in with valid balance' do
      before do
        subject.top_up(Oystercard::MAX_BALANCE)
      end

    end

    it "Expects an error for touching in if balance is less than £1" do
      expect{ subject.touch_in(station) }.to raise_error "You need to top up"
    end
    
  end

  describe '#touch_out' do

    let(:station) { double :station }
    let(:journey){ {entry_station: station, exit_station: station} } 

    context 'balance is reduced by MIN_BALANCE on touch_out' do
      before do
        subject.top_up(Oystercard::MAX_BALANCE)
      end

      it 'penalty is charged if touch out without touching in' do
        expect{ subject.touch_out(station) }.to change{ subject.balance }.by -6
      end

      #it 'touching in and out adds a journey to the list array' do
      #  subject.touch_in(station)
      #  subject.touch_out(station)
      #  expect(subject.journey_list).to include @current_journey
      #end
    end

  end

end