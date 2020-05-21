class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_FARE = 1

  attr_reader :balance, :my_trips

  def initialize
    @balance = 0
    @entry_station = nil
    @my_trips = []
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if  over_limit?(value)
    @balance += value
  end

  def touch_in(station)
    raise "No money" if balance < MINIMUM_FARE
    @my_trips << { :entry => station }
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @my_trips[-1][:exit] = station
  end

  def in_journey?
    return false if @my_trips == []
    !@my_trips[-1][:exit]
  end

  private


  def over_limit?(value)
    value + balance > TOP_UP_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
