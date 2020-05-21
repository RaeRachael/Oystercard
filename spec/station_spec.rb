require 'station'

describe Station do

  it 'initialize a station with zone value' do
    [2,4,5].each do |num|
      station = Station.new(num, "name")
      expect(station.zone).to eq(num)
    end
  end

  it 'initialize a station with a name' do
    ["name1","name2"].each do |name|
      station = Station.new(1, name)
      expect(station.name).to eq(name)
    end
  end
end
