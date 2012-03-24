# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Nader Hendawi', :email => 'naderhen@gmail.com', :password => 'krock923', :password_confirmation => 'krock923'
puts 'New user created: ' << user.name

["MIT", "PAN", "NOR", "TDW", "BFT", "ACA", "CUS", "ARA", "FDA", "LAW", "NFFM", "PEN", "PRY", "SEA", "FTW"].each do |warehouse|
	Warehouse.create! short_name: warehouse
	puts warehouse + ' warehouse created!'
end

["JFK", "EWR", "ATL", "IAD", "MIA", "LAX"].each do |airport|
	Airport.create! short_name: airport
	puts airport + ' airport created!'
end

10.times do
	shipper = Shipper.create! name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number
	puts 'New Shipper Created: ' << shipper.name
end

(2400..2450).each_with_index do |num, index|
	shipper = Shipper.all.shuffle[0]
	date = Date.today - (30 - index)
	warehouse = Warehouse.all.shuffle[0]
	airport = Airport.all.shuffle[0]
	po = shipper.purchaseorders.create! po_number: num, po_date: date, warehouse_id: warehouse.id, airport_id: airport.id

	box_nums = (100...200).to_a
	item_nums = (1...6).to_a
	weights = (60...200).to_a
	grades = ['1+', '1', '2+', '2H', '2', '3', '4']
	species = ['YF', 'BE', 'MAHI', 'SWORD']

	(1...box_nums[rand(box_nums.size)]).each do |num, index|
		(1...item_nums[rand(item_nums.size)]).each do |num2, index2|
			sp = species[rand(species.size)]
			po.items.create! box_number: num, item_number: num2, weight: weights[rand(weights.size)], species: sp, grade: grades[rand(grades.size)]
		end 
	end

	puts "New PO Created: #{po.po_number} #{po.po_date} -- #{shipper.name} -- Warehouse: #{po.warehouse_id} -- Airport: #{po.airport_id}"
end
