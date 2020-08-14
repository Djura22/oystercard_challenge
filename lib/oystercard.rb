require_relative 'journey'
require_relative 'station'
require_relative 'journey_log'

class Oystercard

  attr_accessor :balance, :current_journey, :journey_log

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    #@journey_list = []
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    fail "The maximum limit is: #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.end(exit_station)
    deduct(@journey_log.current_journey.fare)
    #store_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
