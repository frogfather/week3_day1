require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')
require_relative('models/songs')

artist1 = Artist.new({"name" => "Biffy Clyro"})

artist1.save

artist2 = Artist.new({"name" => "Led Zeppelin"})

artist2.save

album1 = Album.new({"name" => "Puzzle", "genre" => "alt rock", "artist_id" => artist1.id})

album1.save()

album2 = Album.new({"name" => "Infinity Land", "genre" => "alt rock", "artist_id" => artist1.id})

album2.save()

album3 = Album.new({"name" => "Physical Graffiti", "genre" => "rock", "artist_id" => artist2.id})

album3.save

album4 = Album.new({"name" => "Houses of the holy", "genre" => "rock", "artist_id" => artist2.id})

album4.save

song1 = Song.new({"title" => "The song remains the same", "length" => 332, "album_id" => album4.id})

song1.save

song2 = Song.new({"title" => "The rain song", "length" => 459, "album_id" => album4.id})

song2.save
song3 = Song.new({"title" => "Over the hills and far away", "length" => 290, "album_id" => album4.id})

song3.save
song4 = Song.new({"title" => "The crunge", "length" => 332, "album_id" => album4.id})

song4.save
song5 = Song.new({"title" => "Dancing days", "length" => 223, "album_id" => album4.id})

song5.save
song6 = Song.new({"title" => "Dyer maker", "length" => 263, "album_id" => album4.id})

song6.save
song7 = Song.new({"title" => "No quarter", "length" => 420, "album_id" => album4.id})

song7.save
song8 = Song.new({"title" => "The ocean", "length" => 271, "album_id" => album4.id})

song8.save


#artist1.delete

#binding.pry
length_in_seconds = album4.album_length
puts"#{album4.name} is #{length_in_seconds/60}:#{length_in_seconds % 60} long"
nil