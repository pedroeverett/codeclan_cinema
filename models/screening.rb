require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :hour, :film_id

  def initialize(options)
    @hour = options['hour']
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (hour, film_id) VALUES ('#{@hour}', '#{@film_id}')RETURNING id"
    screenings = SqlRunner.run(sql).first()
    @id = screenings['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    hours_hashes = SqlRunner.run(sql)
    hour = hours_hashes.map{ |hour_hash| Screening.new(hour_hash)}
    return hour
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end