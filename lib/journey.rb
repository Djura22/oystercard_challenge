require 'station'

class Journey

	attr_accessor :entry_station
	attr_accessor :exit_station
	attr_accessor :journey

	MIN_FARE = 1
	PENALTY_FARE = 6

	def initialize
		@entry_station = nil
		@exit_station = nil
		@journey = nil
	end


	def start_journey(station)
		@entry_station = station
		
	end


	def finish_journey(station)
    @exit_station = station
    @journey = { entry_station: @entry_station, exit_station: @exit_station }
  end


	def fare
		if journey_complete?
		  MIN_FARE
		else
			PENALTY_FARE
		end
	end


	def journey_complete?
    @entry_station && @exit_station
	end


end

