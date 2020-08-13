require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :current_journey#, :journey_list

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    #@journey_list = []
    @current_journey = Journey.new(entry_station)
  end

  def top_up(amount)
    fail "The maximum limit is: #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @current_journey.start_journey(entry_station)
  end

  def touch_out(exit_station = nil)
    @current_journey.finish_journey(exit_station)
    deduct(@current_journey.fare)
    #store_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  #def store_journey
  #  @journey_list.push(@current_journey.journey)
  #end

end
