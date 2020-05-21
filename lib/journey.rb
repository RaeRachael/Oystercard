class Journey

  def initialize(card = Oystercard.new)
    @card = card
    @my_trips = []
  end

  def start(station)
    @my_trips << { :entry => station }
  end

  def finish (station)
    @my_trips[-1][:exit] = station
  end

  def incomplete?
    return false if @my_trips == []
    !@my_trips[-1][:exit]
  end

  def fare
  end

end
