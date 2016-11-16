require('pg')
require_relative('../db/sql_runner')
class Artist
  attr_accessor :name
  attr_reader :id

  def initialize ( options )
    @name = options["name"]
    @id = options["id"] if options["id"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning id;"
    result = SqlRunner.run( sql )
    @id = result[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artist_list = SqlRunner.run( sql )
    return artist_list.map{|artist| Artist.new(artist)}
  end


end