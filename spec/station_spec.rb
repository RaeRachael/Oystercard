require 'station'
describe Station do

  it 'initialize a station with zone value' do
    [2,4,5].each do |num|
      station = Station.new(num)
      expect(station.zone).to eq num
    end
  end

end
