require('pg')
require_relative('../db/sql_runner')
require_relative('customers')

class Ticket
attr_accessor :show_time
attr_reader :id, :customer_id, :film_id

  def initialize( options )
    @id = options['id'] if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
    @show_time = options['show_time']
    end

  def save
    #this also needs to somehow update the customer's funds
    sql = "INSERT INTO tickets (customer_id, film_id, show_time) VALUES (#{@customer_id}, #{@film_id}, '#{@show_time}') returning id;"
    result = SqlRunner.run(sql)
    @id = result[0]['id']
   end

  def update
    sql = "UPDATE tickets SET (customer_id, film_id, show_time) = (#{@customer_id}, #{@film_id},'#{@show_time}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end
  
 end