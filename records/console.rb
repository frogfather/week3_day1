require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')

artist1 = Artist.new({"name" => "Biffy Clyro"})
artist1.save
