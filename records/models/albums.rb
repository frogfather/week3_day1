require('pg')
require_relative('../db/sql_runner')
class Album
attr_accessor :name, :genre
attr_reader :id

  def initialize( options )
    @name = options["name"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ('#{@name}', '#{@genre}', #{@artist_id}) returning id;"
    result = SqlRunner.run( sql )
    @id = result[0]["id"].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    artist_list = SqlRunner.run(sql)
    return Artist.new(artist_list[0])
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|hash| Artist.new(hash)}
  end

  def delete_all
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def update
    return unless @id
    sql = "UPDATE albums SET (name, genre, artist_id) VALUES ('#{@name}', '#{@genre}', #{@artist_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete
    return unless @id
    sql = "DELETE FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

end