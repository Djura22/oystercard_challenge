require 'journey'

describe Journey do

  let(:station) { double :station, :station_zone => 1 }
  let(:station2) { double :station2, :station_zone => 3 }


  it 'Journey is an instance of the class' do
  	expect(subject).to be_instance_of Journey
  end


  it 'responds to method' do
    expect(subject).to respond_to(:start_journey).with(1).argument
  end

  describe 'start_journey' do

  	it "Stores the entry station" do
      subject.start_journey(station)
      expect(subject.entry_station).to eq station
    end
  end


  it 'responds to method' do
    expect(subject).to respond_to(:finish_journey).with(1).argument
  end

  describe 'finish_journey' do

  	it "Stores the exit station" do
      subject.finish_journey(station)
      expect(subject.exit_station).to eq station
    end

  end


  it 'responds to method' do
    expect(subject).to respond_to(:fare)
  end

  describe 'fare' do

  	it 'charges minimum fare if both entry and exit are logged' do
  		subject.start_journey(station)
  		subject.finish_journey(station)
  		expect(subject.fare).to eq Journey::MIN_FARE
  	end

  	it 'charges penalty fare if there is a break in the journey chain' do
  		expect(subject.fare).to eq Journey::PENALTY_FARE
  	end

    it 'charges for zone entries' do
      subject.start_journey(station)
      subject.finish_journey(station2)
      expect(subject.fare).to eq 3
    end

  end

  describe 'journey_complete?' do

    it 'Journey is complete' do
      subject.start_journey(station)
      subject.finish_journey(station)
      expect(subject).to be_journey_complete
    end
  end


end