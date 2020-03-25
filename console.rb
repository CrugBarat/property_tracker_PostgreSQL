require('pry-byebug')
require_relative('modules/property.rb')


property1 = Property.new({'address' => '1 King St',
                          'no_bedrooms' => 6,
                          'status' => 'BUY',
                          'value' => 1_000_000})

property2 = Property.new({'address' => '2 Queen Pl',
                          'no_bedrooms' => 5,
                          'status' => 'BUY',
                          'value' => 500_000})

property3 = Property.new({'address' => '3 Bishop Rd',
                          'no_bedrooms' => 4,
                          'status' => 'SOLD',
                          'value' => 250_000})

property4 = Property.new({'address' => '4 Knight Ave',
                          'no_bedrooms' => 3,
                          'status' => 'SOLD',
                          'value' => 150_000})

property5 = Property.new({'address' => '5 Duke Cr',
                          'no_bedrooms' => 2,
                          'status' => 'BUY',
                          'value' => 100_000})

property6 = Property.new({'address' => '6 Pawn Ln',
                          'no_bedrooms' => 1,
                          'status' => 'BUY',
                          'value' => 50_000})


property1.save()
property2.save()
property3.save()
property4.save()
property5.save()
property6.save()

properties = Property.all()
find_by_id = Property.find_by_id(4)
find_by_address = Property.find_by_address('4 Knight Ave')
find_by_status = Property.find_by_status('BUY')
find_by_value_range = Property.find_by_value_range(100000, 500000)

property4.status = 'BUY'
property4.value = 175_000
property5.status = 'SOLD'
property5.update()

property6.delete()
properties = Property.delete_all()

binding.pry
nil
