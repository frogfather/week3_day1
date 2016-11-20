require('pg')
require_relative('../db/sql_runner')

class Customer
  attr_accessor :name, :funds
  attr_reader :id

  def initialize( options )
    @id = options['id'] if options['id']
    @name = options['name']
    @funds = options['funds'].to_f
  end

#save, update, read, delete
  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}',#{funds}) returning id;"
    result = SqlRunner.run(sql)   
    @id = result[0]["id"].to_i
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_customers
    sql = "SELECT * FROM customers;"
    customer_list = SqlRunner.run(sql)
    return customer_list.map{|customer| Customer.new(customer)}
  end

  def delete
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end
  
  def update_funds(film_price)
    #binding.pry
    funds = @funds.to_f
    funds -= film_price
    @funds = funds
    self.update
  end

  def tickets_bought
    #this *should* work! and doesn't ;(
    sql = "SELECT sum(1) FROM tickets WHERE customer_id = #{@id};"
    result = SqlRunner.run(sql)[0]
    return result['sum']
  end
end