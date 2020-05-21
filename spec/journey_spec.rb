require_relative "../lib/journey.rb"

describe "Journey" do
  let(:card_double) {double(:card)}
  let(:station) {double(:station_a)}
  let(:exit_station) {double(:station_b)}

  before  do
    journey = Journey.new(card_double)
  end

  describe '#start(station, card = default)' do
    it "should change #incomplete to true" do
      journey = Journey.new(card_double)
      journey.start(station)
      expect(journey).to be_incomplete
    end
  end

  describe "#end(station, card = default)" do
    it "should change #incomplete to false" do
      journey = Journey.new(card_double)
      journey.start(station)
      journey.finish(exit_station)
      expect(journey).not_to be_incomplete
    end

  end

  describe "#fare" do
    it "should be min_fare if journey is complete" do
      journey = Journey.new(card_double)
      expect(journey.fare).to eq(1)
    end
    it "should be penalty_fare if journey is incomplete" do
      journey = Journey.new(card_double)
      expect(journey.fare).to eq(6)
    end
  end

  describe "#incomplete?" do
    it "should return true" do
      journey = Journey.new(card_double)
      expect(journey).not_to be_incomplete
    end
    it "should return false" do
      journey = Journey.new(card_double)
      journey.start(station)
      expect(journey).to be_incomplete
    end
    it "should return true" do
      journey = Journey.new(card_double)
      journey.start(station)
      journey.finish(exit_station)
      expect(journey).not_to be_incomplete
    end
  end

  describe "#my_trip" do
    xit 'should have no journeys at the start' do
      expect(journey.my_trips).to eq([])
    end
    xit 'should print my trip' do
      journey.start(station)
      journey.finish(exit_station)
      expect(journey.my_trips).to eq([{:entry => entry_station, :exit => exit_station}])
    end
    xit 'store two trips in an array' do
      2.times do
        journey.start(station)
        journey.finish(exit_station)
      end
      expect(journey.my_trips).to eq([{:entry => entry_station, :exit => exit_station}, {:entry => entry_station, :exit => exit_station}])
    end
  end

end
