require ('pg')

class Bounty
  attr_accessor :name, :bounty_value, :last_location, :favourite_weapon
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @bounty_value = options['bounty_value']
    @last_location = options['last_location']
    @favourite_weapon = options['favourite_weapon']
    @id = options['id'].to_i if options['id']
  end

  def save
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    query = "INSERT INTO bounty
    (name, bounty_value, last_location, favourite_weapon)
    VALUES
    ('#{@name}', #{@bounty_value}, '#{@last_location}', '#{@favourite_weapon}') returning *;"
    result = db.exec(query)
    @id = result[0]['id'].to_i
    db.close
  end

  def delete
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    query = "DELETE FROM bounty WHERE id = #{@id};"
    db.exec(query)
    db.close
  end

  def self.select_one(id_to_find)
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    query = "SELECT * FROM bounty WHERE id = #{id_to_find};"
    cowboy = db.exec(query)
    db.close
  new_array = cowboy.map {|hash| Bounty.new(hash)}  
  return new_array[0]
  end

  def self.all
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    query = "SELECT * FROM bounty;"
    result = db.exec(query)
    db.close
    return result.map {|hash| Bounty.new(hash)}
  end

  def update
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    query = "UPDATE bounty SET (name, bounty_value, last_location, favourite_weapon) = 
    ('#{@name}', #{@bounty_value}, '#{@last_location}', '#{@favourite_weapon}') WHERE id = #{@id};"
    db.exec(query)
    db.close 
  end
end