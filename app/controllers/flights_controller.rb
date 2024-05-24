class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @flight_codes = Airport.all.map { |f| [f.code, f.id] }
    @flight_dates = @flights.all.map { |f| [f.departure_datetime.to_date, f.id] }

    @available_flights = Flight.where(arrival_airport: flight_params[:arrival_code],
                                      departure_airport: flight_params[:departure_code])
  end

  private

  def flight_params
    params.permit(:arrival_code, :departure_code, :date, :num_tickets)
  end
end
