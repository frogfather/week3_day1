require('pry-byebug')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all
Customer.delete_all
Film.delete_all


customer1 = Customer.new({"name" => "Denzel Washington", "funds" => "10000.00"})
customer2 = Customer.new({"name" => "Harrison Ford", "funds" => "8000.00"})

#binding.pry
customer1.save

customer2.save

customer1.name = "Fred Philadelphia"
customer1.funds = "200.00"
customer1.update

customer3 = Customer.new({"name" => "Delete Me", "funds" => "5000.00"})
customer3.save

customer3.delete

film1 = Film.new({"title" =>"The Third Man", "price" => "8.00"})

film1.save

film2 = Film.new({"title" =>"Alien", "price" => "9.00"})

film2.save

film1.price = "7.00"
film1.update

film3 = Film.new({"title" =>"Zootropolis", "price" => "6.50"})

film3.save

film3.delete

#binding.pry
return unless customer1.funds.to_f >= film1.price.to_f
ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id, "show_time" => "15:00"})
ticket1.save
film_price = film1.price.to_f
customer1.update_funds(film_price)

return unless customer1.funds.to_f >= film2.price.to_f
ticket2 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id, "show_time" => "19:00"})
ticket2.save
film_price = film2.price.to_f
customer1.update_funds(film_price)


#I would change this to read ticket instead of tickets for values of 1 if time allowed!
puts customer1.name+" bought "+customer1.tickets_bought+" ticket(s)."

puts film2.tickets_sold+" ticket(s) have been sold for "+film2.title

nil