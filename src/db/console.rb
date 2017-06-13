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

animal4 = Animal.new({
  'name' => 'Chase',
  'type' => 'Dog',
  'breed' => 'Jack Russell',
  'age' => '5',
  'date_added' => '12/06/2017',
  'available' => 'true'
  })
animal4.save()

animal5 = Animal.new({
  'name' => 'Diego',
  'type' => 'Dog',
  'breed' => 'Jack Russell x Pug',
  'age' => '2',
  'date_added' => '02/06/2017',
  'available' => 'true'
  })
animal5.save()

animal6 = Animal.new({
  'name' => 'Freya',
  'type' => 'Dog',
  'breed' => 'German Shepherd',
  'age' => '8',
  'date_added' => '08/06/2017',
  'available' => 'true'
  })
animal6.save()

animal7 = Animal.new({
  'name' => 'Minnie',
  'type' => 'Dog',
  'breed' => 'Pomeranian',
  'age' => '4',
  'date_added' => '09/06/2017',
  'available' => 'true'
  })
animal7.save()

owner1 = Owner.new({
  'first_name' => 'Jia',
  'last_name' => 'Wong',
  })
owner1.save()

adoption1 = Adoption.new({
  'owner_id' => owner1.id,
  'animal_id' => animal2.id
  })
adoption1.save()

# binding.pry
# nil