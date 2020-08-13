require 'journey_log'

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
  	expect(subject).to respond_to(:journey_list)
  end

  it 'responds to method' do
  	expect(subject).to respond_to(:log_current)
  end




	
end