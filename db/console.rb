require(pry-byebug)
require_relative('../models/ticket.rb')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Pedro', 'funds' => 500})
customer2 = Customer.new({'name' => 'Liliana', 'funds' => 700})

customer1.save()
customer2.save()

film1 = Film.new({'title' => 'Dead Zombie', 'price' => 20, 'hour' => '19:00'})
film2 = Film.new({'title' => 'Alive Goat', 'price' => 25, 'hour' => '19:00'})
film3 = Film.new({'title' => 'Brown Bag', 'price' => 20, 'hour' => '21:00'})
film4 = Film.new({'title' => 'Square Car', 'price' => 30, 'hour' => '23:00'})

film1.save()
film2.save()
film3.save()
film4.save()

ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id})
ticket4 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id})
ticket5 = Ticket.new({'film_id' => film4.id, 'customer_id' => customer1.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

binding.pry
nil