require_relative "../lib/journey.rb"

describe "Journey" do
  let(:card_doube) {double(:card)}
  let(:station_a) {double(:station_a)}
  let(:station_b) {double(:station_b)}
  let(:subject) {Journey.new(card_double)}

  describe "#start(station, card = default)" do
    journey1 = subject
    journey1.start(station_a)
  end

  describe "#end(station, card = default)" do


  end

  describe "#fare_check" do

  end

  describe "#incomplete?" do

  end

end
