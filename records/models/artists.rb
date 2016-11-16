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

  def update
    return unless @id
    sql = "UPDATE artists SET (name) VALUES ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def albums_by_this_artist()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    album_list = SqlRunner.run(sql)
    return album_list.map {|hash| Album.new(hash)}
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artist_list = SqlRunner.run( sql )
    return artist_list.map{|artist| Artist.new(artist)}
  end

  def delete() 
  #can't delete an artist without first 
  #deleting associated albums.
  #Use albums function above and call
  #delete on each one?
  
  albums_to_delete =albums_by_this_artist
  albums_to_delete.each do
    |album|
    to_delete = album.id
    sql = "DELETE FROM albums 
      WHERE id = #{to_delete};"
    SqlRunner.run(sql)  
    end
  #now we've deleted the albums we can delete the artist
  sql = "DELETE FROM artists 
  WHERE id = #{@id};"
  SqlRunner.run(sql)      
  end


end