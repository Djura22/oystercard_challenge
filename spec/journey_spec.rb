require 'journey'

describe Journey do
  it 'Journey is an instance of the class' do
  	expect(subject).to be_instance_of Journey
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:start_journey)
  end
  
  it 'responds to method' do
  	expect(subject).to respond_to(:finish_journey)
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:fare)
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:journey_complete)
  end



  describe 'start_journey' do

    let(:station) { double :station }

  	it "Stores the entry station" do
      subject.start_journey(station)
      expect(subject.entry_station).to eq station
    end
  end



  describe 'finish_journey' do

  	let(:station) { double :station }

  	it "Stores the exit station" do
      subject.finish_journey(station)
      expect(subject.exit_station).to eq station
    end

  end


  describe 'fare' do

  	let(:station) { double :station }

  	it 'charges minimum fare if both entry and exit are logged' do
  		subject.start_journey(station)
  		subject.finish_journey(station)
  		expect(subject.fare).to eq Journey::MIN_FARE
  	end

  	it 'charges penalty fare if there is a break in the journey chain' do
  		expect(subject.fare).to eq Journey::PENALTY_FARE
  	end

  end


end