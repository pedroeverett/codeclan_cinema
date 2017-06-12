require('pry-byebug')
require_relative('../models/screening.rb')
require_relative('../models/ticket.rb')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Pedro', 'funds' => 500})
customer2 = Customer.new({'name' => 'Liliana', 'funds' => 700})

customer1.save()
customer2.save()

film1 = Film.new({'title' => 'Dead Zombie', 'price' => 20})
film2 = Film.new({'title' => 'Alive Goat', 'price' => 25})
film3 = Film.new({'title' => 'Brown Bag', 'price' => 20})

film1.save()
film2.save()
film3.save()

screening1 = Screening.new({'hour' => '19:00', 'film_id' => film1.id})
screening2 = Screening.new({'hour' => '19:00', 'film_id' => film2.id})
screening3 = Screening.new({'hour' => '19:00', 'film_id' => film3.id})
screening4 = Screening.new({'hour' => '21:00', 'film_id' => film1.id})
screening5 = Screening.new({'hour' => '21:00', 'film_id' => film2.id})
screening6 = Screening.new({'hour' => '23:00', 'film_id' => film1.id})
screening7 = Screening.new({'hour' => '23:00', 'film_id' => film2.id})
screening8 = Screening.new({'hour' => '23:00', 'film_id' => film3.id})

screening1.save()
screening2.save()
screening3.save()
screening4.save()
screening5.save()
screening6.save()
screening7.save()
screening8.save()


ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id, 'screening_id' => screening1.id})
ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id, 'screening_id' => screening2.id})
ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id, 'screening_id' => screening3.id})
ticket4 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id, 'screening_id' => screening3.id})
ticket5 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer1.id, 'screening_id' => screening7.id})
ticket6 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer2.id, 'screening_id' => screening6.id})
ticket7 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id, 'screening_id' => screening8.id})


ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()




binding.pry
nil