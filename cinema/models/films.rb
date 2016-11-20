require('pg')
require_relative('../db/sql_runner')

class Film
  attr_accessor :title, :price
  attr_reader :id
  def initialize( options )
    @id = options['id'] if options['id']
    @title = options['title']
    @price = options['price'].to_f
  end

  def save
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) returning id;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end

  def update
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_films
    sql = "SELECT * FROM films;"
    film_list = SqlRunner.run(sql)
    return film_list.map{|film| Film.new(film)}
  end

  def delete
    sql = "DELETE FROM films WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def tickets_sold
    sql = "SELECT sum(1) FROM tickets WHERE film_id = #{@id}"
    result = SqlRunner.run(sql)[0]
    return result['sum']
  end

end