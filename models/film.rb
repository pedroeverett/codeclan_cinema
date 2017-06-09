require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price, :hour

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
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


end