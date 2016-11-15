require('pry-byebug')
require_relative('models/bounty')

bounty1 = Bounty.new({
  'name' => 'Lance Isidor',
  'bounty_value' => 500,
  'last_location' => 'Betelgeuse',
  'favourite_weapon' => 'left handed hammer'
  })

bounty1.save
bounty1.name = 'Jonty Arno'
bounty1.favourite_weapon = 'pickaxe'
bounty1.update

bounty_to_update = Bounty.select_one(3)
#binding.pry
bounty_to_update.name = 'Arminius Desideratus'
bounty_to_update.favourite_weapon = 'Candlestick'
bounty_to_update.update
#bounty1.delete

#bounties = Bounty.all()