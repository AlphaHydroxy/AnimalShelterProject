require_relative '../db/sql_runner'
require_relative './adoptions'

class AdoptionsRepository
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id']
    @animal_id = options['animal_id']
    @adoption = option['adoption']
  end

  def self.get_all_adoptions()
    sql = "SELECT owners.first_name, owners.last_name, animals.name 
    FROM adoptions 
    INNER JOIN owners ON adoptions.owner_id= owners.id 
    INNER JOIN animals ON adoptions.animal_id = animals.id;"
    adoption = SqlRunner.run(sql)
    return adoption.map { |adoption|Adoption.new(adoption) }
  end

end