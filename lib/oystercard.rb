require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :journey_list
  attr_accessor :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_list = []
    @current_journey = Journey.new

  end

  def top_up(amount)
    fail "The maximum limit is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @in_journey = true
    @current_journey.start_journey(station)
  end

  def touch_out(station)
    @current_journey.finish_journey(station)
    deduct(@current_journey.fare)
    @in_journey = false
    store_journey
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def store_journey
    @journey_list.push(Journey.new.journey)
  end


end
