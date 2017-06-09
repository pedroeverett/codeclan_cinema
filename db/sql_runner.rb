require('pg')
require_relative('../models/customer.rb')
require_relative('../models/film.rb')

class SqlRunner

  def SqlRunner.run(sql)
    begin
      db = PG.connect({dabase: 'cc_cinema', hotsname: 'localhost' })
      result = db.exec(sql)
    ensure
      db.close()
    end
    return result
  end
  
end