require 'journey_log'

describe JourneyLog do

  let(:station) { double :station }
  let(:journey){ {entry_station: station, exit_station: station} } 

	it 'JourneyLog is an instance of the class' do
  	expect(subject).to be_instance_of JourneyLog
  end


  it 'responds to method' do
  	expect(subject).to respond_to(:start)
  end

  describe '#start' do

    it 'creates entry_station' do
      subject.start(station)
      expect(subject.current_journey.entry_station).to eq station
    end
  end
  

  it 'responds to method' do
  	expect(subject).to respond_to(:end)
  end

  describe '#end' do

    it 'creates exit_station' do
      subject.start(station)
      subject.end(station)
      expect(subject.current_journey.exit_station).to eq station
    end
  end
end 