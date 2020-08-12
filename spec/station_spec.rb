require 'station'

describe Station do
  it 'is an instance of Station' do
  	expect(subject).to be_instance_of Station
  end

  it 'Station responds to station_name' do
  	expect(subject).to respond_to(:station_name)
  end

  it 'Station responds to zone' do
  	expect(subject).to respond_to(:station_zone)
  end

end