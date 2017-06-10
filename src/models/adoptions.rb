require_relative '../db/sql_runner'

class Adoption
  attr_accessor :id, :owner_id, :animal_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner = options['owner']
    @animal = options['animal']
  end

  def save()
    sql = "INSERT INTO adoptions (owner_id, animal_id) VALUES ('#{@owner.id}', '#{@animal.id}') RETURNING id;"
    adoption = SqlRunner.run(sql).first
    @id = adoption['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    adoption = SqlRunner.run(sql)
    return adoption.map { |adoption|Adoption.new(adoption) }
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions;"
    SqlRunner.run(sql)
  end

  def show_owners_and_pets()
    sql = "SELECT owners.first_name, animals.name FROM adoptions INNER JOIN owners ON adoptions.owner_id= owners.id INNER JOIN animals ON adoptions.animal_id = animals.id;"
    SqlRunner.run(sql)
  end
end