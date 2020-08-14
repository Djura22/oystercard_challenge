#require 'station'
#require_relative 'journey_log'
#require_relative 'oystercard'

class Journey

	attr_accessor :entry_station, :exit_station, :current

	MIN_FARE = 1
	PENALTY_FARE = 6

	def initialize
	  @entry_station = nil
	  @exit_station = nil
	  @current = nil
	end


	def start_journey(entry_station)
    @entry_station = entry_station
	end


	def finish_journey(exit_station)
    @exit_station = exit_station
    @current = { :entry_station => @entry_station, :exit_station => @exit_station }
    self
    end

	def fare
		if journey_complete?
		  MIN_FARE + (@entry_station.station_zone - @exit_station.station_zone).abs
		else
		  PENALTY_FARE
		end
	end

	def journey_complete?
    !!@entry_station && !!@exit_station
	end

end


