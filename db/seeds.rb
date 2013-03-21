# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach('doc/bulbs.csv', :headers => true) do |bulb|
	bulb_hash = bulb.to_hash
	Bulb.create!(
		{
			:cost => bulb_hash["Cost"],
			:energy_star => bulb_hash["Energy Star"],
			:link => bulb_hash["Equipment Link"],
			:lookup_code => bulb_hash["Lookup Code"],
			:lumens => bulb_hash["Lumens"],
			:manufacturer => bulb_hash["Manufacturer"],
			:model_number => bulb_hash["MFG Model #"],
			:temperature => bulb_hash["Temp"],
			:bulb_type => bulb_hash["Type"],
			:wattage => bulb_hash["Wattage"]
		}
	)
end