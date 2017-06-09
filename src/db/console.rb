require_relative '../models/animals'
require_relative '../models/owners'
require 'pry-byebug'

animal1 = Animal.new({
  'name' => 'Rocky',
  'type' => 'Dog',
  'breed' => 'Pomeranian',
  'age' => '3',
  'date_added' => '30/05/2017',
  'adoptable' => 'false'
  })
animal1.save()

animal2 = Animal.new({
  'name' => 'Terry',
  'type' => 'Reptile',
  'breed' => 'Terrapin',
  'age' => '9',
  'date_added' => '22/05/2017',
  'adoptable' => 'true'
  })
animal2.save()

animal3 = Animal.new({
  'name' => 'Lilly',
  'type' => 'Reptile',
  'breed' => 'Terrapin',
  'age' => '9',
  'date_added' => '22/05/2017',
  'adoptable' => 'true'
  })
animal3.save()

owner1 = Owner.new({
  'first_name' => 'Jia',
  'last_name' => 'Wong'
  })
owner1.save()

owner2 = Owner.new({
  'first_name' => 'Erlich',
  'last_name' => 'Bachman'
  })
owner2.save()
