require_relative 'oystercard'
require_relative 'journey'

class JourneyLog

attr_accessor :current_journey
attr_reader :journeys

	def initialize#(journey_class = Journey)
		@current_journey = Journey.new
		@journeys = []

	end


  def start(entry_station)
    @current_journey.start_journey(entry_station)
  end

  def end(exit_station)
    @current_journey.finish_journey(exit_station)
    store_journey
  end



  private

  def store_journey
    @journeys.push(@current_journey.current)
    @current_journey.current = nil
  end


  def journeys
    @journeys.dup
  end


  #def current_journey(journey)
  #	if journey[:entry_station] == nil
  #	  journey[:entry_station] = "Incomplete Journey"
  #	elsif journey[:exit_station] == nil
  #	  journey[:exit_station] = "Incomplete Journey"
  # end
  #end
end