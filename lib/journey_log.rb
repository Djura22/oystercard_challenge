require_relative 'oystercard'
require_relative 'journey'

class JourneyLog

attr_accessor :start, :end, :journey_list

	def initialize#(journey_class = nil)
		#@journey_class = journey_class
		@journeys = []
		@start
		@end
		@journey_list

	end
  
  def log_current
  	@journeys << { :entry_station => @start, :exit_station => @end }
  end

end