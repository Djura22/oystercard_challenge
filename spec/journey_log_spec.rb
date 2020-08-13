require 'journey_log'
require 'oystercard'
require 'journey'

describe JourneyLog do

	it 'JourneyLog is an instance of the class' do
  	expect(subject).to be_instance_of JourneyLog
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:start)
  end
  
  it 'responds to method' do
  	expect(subject).to respond_to(:end)
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:journeys)
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:log)
  end

  describe 'log_current' do

    let(:station) { double :station }

  	it 'journeys array contains start and end stations' do
  		expect(subject.log).to eq subject.journeys
  	end

  end
	
end 