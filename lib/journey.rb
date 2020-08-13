#require 'station'
require_relative 'journey_log'
require_relative 'oystercard'

class Journey

	attr_accessor :entry_station, :exit_station, :journey, :current_log

	MIN_FARE = 1
	PENALTY_FARE = 6

	def initialize(entry_station = nil)
	  @entry_station = entry_station
	  @exit_station = nil
	  @current_log = JourneyLog.new
	end


	def start_journey(entry_station)
    @entry_station = entry_station
    @current_log.start = entry_station
	end


	def finish_journey(exit_station)
    @exit_station = exit_station
    @current_log.end = exit_station
    @current_log.log
  end

	def fare
		if journey_complete?
		  MIN_FARE
		else
			PENALTY_FARE
		end
	end

	def journey_complete?
    !!@entry_station && !!@exit_station
	end

end


