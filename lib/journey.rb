class Journey

  def initialize(card = Oystercard.new)
    @card = card
    @my_trips = []
  end

  def start(station = nil)
    @my_trips << { :entry => station }
  end

  def finish (station = nil)
    @my_trips[-1][:exit] = station
    fare
  end

  def incomplete?
    return false if @my_trips == []
    !@my_trips[-1][:exit] || !@my_trips[-1][:entry]
  end

  def fare
    incomplete? ? 6 : 1
  end

end
