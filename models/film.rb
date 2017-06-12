require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price, :hour

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', '#{@price}') RETURNING id"
    film = SqlRunner.run(sql).first()
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', '#{@price}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def customers()
    sql ="SELECT customers.* FROM customers
          INNER JOIN tickets
          ON tickets.customer_id = customers.id 
          WHERE tickets.film_id = #{@id}"
    customers_hashes = SqlRunner.run(sql)
    result = customers_hashes.map{ |customer_hash| Customer.new(customer_hash)}
  end

  def how_many_customers()
    sql = "SELECT COUNT(customers.*) AS total FROM customers
          INNER JOIN tickets
          ON tickets.customer_id = customers.id
          WHERE tickets.film_id = #{@id}"
    customers = SqlRunner.run(sql).first()
    return customers['total'].to_i   
  end

  def best_hour()
    sql = "SELECT screenings.* FROM screenings 
        INNER JOIN tickets
        ON tickets.screening_id = screenings.id
        WHERE tickets.film_id = #{@id}"
    hours = SqlRunner.run(sql)
    result = hours.map{ |hour| Screening.new(hour)}
  end

  def self.all()
    sql = "SELECT * FROM films"
    films_hashes = SqlRunner.run(sql)
    film = films_hashes.map{|film_hash| Film.new(film_hash)}
    return film
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end