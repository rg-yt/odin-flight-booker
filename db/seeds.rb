# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

%w[DEN JFK LAX BWI PHL IAD LGA ABQ].each do |code|
  Airport.create(code:)
end

Airport.all.each do |arrival|
  Airport.all.each do |depart|
    next if arrival == depart

    Flight.create(arrival_airport_id: arrival.id, departure_airport_id: depart.id, departure_datetime: rand(1.year.ago..Time.now),
                  flight_duration: rand(1.hour...10.hour))
  end
end
