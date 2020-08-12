require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :entry_station, :journey, :exit_station, :journey_list
  attr_accessor :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey = nil
    @journey_list = []
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
    @journey = { entry_station: @entry_station, exit_station: @exit_station }
    @journey_list.push(@journey)
  end


end
