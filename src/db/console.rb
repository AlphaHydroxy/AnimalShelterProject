require_relative '../models/animals'
require_relative '../models/owners'
require_relative '../models/adoptions'
require 'pry-byebug'

Animal.delete_all()
Owner.delete_all()
Adoption.delete_all()

animal1 = Animal.new({
  'name' => 'Rocky',
  'type' => 'Dog',
  'breed' => 'Pomeranian',
  'age' => '3',
  'date_added' => '30/05/2017',
  'available' => 'false'
  })
animal1.save()

animal2 = Animal.new({
  'name' => 'Terry',
  'type' => 'Reptile',
  'breed' => 'Terrapin',
  'age' => '9',
  'date_added' => '22/05/2017',
  'available' => 'true'
  })
animal2.save()

animal3 = Animal.new({
  'name' => 'Lilly',
  'type' => 'Reptile',
  'breed' => 'Terrapin',
  'age' => '9',
  'date_added' => '22/05/2017',
  'available' => 'true'
  })
animal3.save()

owner1 = Owner.new({
  'first_name' => 'Jia',
  'last_name' => 'Wong',
  })
owner1.save()

owner2 = Owner.new({
  'first_name' => 'Erlich',
  'last_name' => 'Bachman',
  })
owner2.save()

adoption1 = Adoption.new({
  'owner' => owner1,
  'animal' => animal2
  })
adoption1.save()

adoption2 = Adoption.new({
  'owner' => owner2,
  'animal' => animal3
  })
adoption2.save()

binding.pry
nil