class Oystercard

  attr_reader :balance, :entry_station, :journey
  attr_accessor :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journey = []
  end

  def top_up(amount)
    fail "The maximum limit is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @in_journey = true
    @entry_station = station

  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @in_journey = false
    @exit_station = station
  end

  def in_journey?
    !!entry_station
  end


  private

  def deduct(amount)
    @balance -= amount
  end


end
