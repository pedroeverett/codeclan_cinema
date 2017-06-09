require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price, :hour

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
    @hour = options['hour']
  end

  def save()
    sql = "INSERT INTO films (title, price, hour) VALUES ('#{@title}', '#{@price}', '#{@hour}') RETURNING id"
    film = SqlRunner.run(sql).first()
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price, hour) = ('#{@title}', '#{@price}', '#{@hour}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
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