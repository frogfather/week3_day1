require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')

artist1 = Artist.new({"name" => "Biffy Clyro"})
artist1.save

album1 = Album.new({"name" => "Puzzle", "genre" => "alt rock", "artist_id" => artist1.id})

album1.save()

album2 = Album.new({"name" => "Infinity Land", "genre" => "alt rock", "artist_id" => artist1.id})

album2.save()

binding.pry

nil