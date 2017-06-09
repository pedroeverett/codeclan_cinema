require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES ('#{@film_id}', '#{@customer_id}') RETURNING id"
    tickets = SqlRunner.run(sql).first()
    @id = tickets['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (film_id, customer_id) = ('#{@film_id}', '#{@customer_id}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets_hashes = SqlRunner.run(sql)
    ticket = tickets_hashes.map{ |ticket_hash| Ticket.new(ticket_hash)}
    return ticket
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end
  
end