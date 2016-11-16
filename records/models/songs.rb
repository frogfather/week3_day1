require('pg')
require_relative('../db/sql_runner')

class Song
attr_accessor :title, :length
attr_reader :id

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @length = options["length"].to_i
    @album_id = options["album_id"].to_i
  end

  def save
    sql = "INSERT INTO songs (title, length, album_id) VALUES ('#{@title}', #{@length}, #{@album_id}) returning id;"
    result = SqlRunner.run( sql )
    @id = result[0]["id"].to_i
  end

end