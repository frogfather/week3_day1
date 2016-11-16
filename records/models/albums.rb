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



end