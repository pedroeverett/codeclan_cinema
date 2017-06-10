require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', '#{@funds}') RETURNING id"
    customer = SqlRunner.run(sql).first()
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', '#{@funds}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM custumores WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films()
    sql ="SELECT films.* FROM films
          INNER JOIN tickets
          ON tickets.film_id = films.id 
          WHERE tickets.customer_id = #{@id}"
    films_hashes = SqlRunner.run(sql)
    result = films_hashes.map{ |film_hash| Film.new(film_hash)}
  end

  def buy()
    sql = "SELECT SUM(films.price) AS total FROM films
              INNER JOIN tickets
              ON tickets.film_id = films.id 
              WHERE tickets.customer_id = #{@id}"
     tickets = SqlRunner.run(sql).first         
    @funds = @funds - tickets['total'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers_hashes = SqlRunner.run(sql)
    customer = customers_hashes.map{ |customer_hash| Customer.new(customer_hash)}
    return customer
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end