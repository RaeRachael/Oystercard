require 'oystercard'

describe Oystercard do

  let(:entry_station) { entry_station = double(:station) }
  let(:exit_station) { exit_station = double(:station) }



  it "has a balance" do
    expect(subject.balance).to eq(0)
  end

  it "tops up balance with" do
    expect(subject.top_up(10)).to eq 10
  end

  it "errors with over limit" do
    limit = Oystercard::TOP_UP_LIMIT
    expect { subject.top_up(limit + 1) } .to raise_error "Error, card has limit of #{limit}"
  end

  describe '#in_journey?' do ### Journey
    it "should return false" do
      expect(subject).not_to be_in_journey
    end
  end

  context "no top up" do

    describe "#my_trips" ## Journey
      it 'should have no journeys at the start' do
        expect(subject.my_trips).to eq([])
      end
    describe "#touch_in" do
      it "should raise_error 'No money' if balance is below min_fare" do
        expect { subject.touch_in(entry_station) }.to raise_error( "No money" )
      end
    end
  end

  context "top_up 5" do
    before do
      subject.top_up(5)
      subject.touch_in(entry_station)
    end

    describe '#touch_in' do  ## copy over to journey
      it "should change #in_journey to true" do
        expect(subject).to be_in_journey
      end
    end

    describe '#touch_out' do ## copy over to journey
      it "should change #in_journey to false" do
        subject.touch_out(exit_station)
        expect(subject).not_to be_in_journey
      end
      it "should deduct the minimum fare from the card" do
        min_fare = Oystercard::MINIMUM_FARE
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-min_fare)
      end
    end

    describe '#my_trip' do  ### Journey
      it 'should print my trip' do
        subject.touch_out(exit_station)
        expect(subject.my_trips).to eq([{:entry => entry_station, :exit => exit_station}])
      end
      it 'store two trips in an array' do
        subject.touch_out(exit_station)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.my_trips).to eq([{:entry => entry_station, :exit => exit_station}, {:entry => entry_station, :exit => exit_station}])
      end
    end
  end
end
