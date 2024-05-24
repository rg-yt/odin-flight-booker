class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @flight_codes = Airport.all.map { |f| [f.code, f.id] }
    @flight_dates = @flights.all.map { |f| [f.departure_datetime.to_date, f.id] }
  end

  private

  def flight_params
    params.require(:flight).permit(:arrival_code, :departure_code, :date, :num_tickets)
  end
end
