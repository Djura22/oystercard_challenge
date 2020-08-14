require 'journey_log'

describe JourneyLog do

	it 'JourneyLog is an instance of the class' do
  	expect(subject).to be_instance_of JourneyLog
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:start)
  end

  describe '#start' do

    let(:station) { double :station }
    let(:journey){ {entry_station: station, exit_station: station} } 

    it 'creates entry_station' do
      subject.start(station)
      expect(subject.current_journey.entry_station).to eq station
    end
  end
  
  it 'responds to method' do
  	expect(subject).to respond_to(:end)
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:journeys)
  end

  describe 'log_current' do

    let(:station) { double :station }

  	it 'journeys array contains start and end stations' do
  		expect(subject.log).to eq subject.journeys
  	end

  end
	
end 