require_relative 'oystercard'
require_relative 'journey'

class JourneyLog

attr_accessor :start, :end
attr_reader :journeys

	def initialize#(journey_class = nil)
		#@journey_class = journey_class
		@journeys = []
		@start
		@end

	end
  
  def log
  	@journeys << { :entry_station => @start, :exit_station => @end }
  end

end