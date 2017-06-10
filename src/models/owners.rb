require_relative '../db/sql_runner'
require 'pry-byebug'

class Owner
  attr_accessor :id, :first_name, :last_name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @animal = options['animal']
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name, animal_id) VALUES ('#{first_name}', '#{last_name}', #{@animal.id}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    owners = SqlRunner.run(sql)
    return owners.map{ |owner| Owner.new(owner) }
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id};"
    owner = SqlRunner.run(sql)
    return Owner.new(owner.first)
  end

  def find_owner()
    sql = "SELECT * FROM animals WHERE animals.id = '#{@animal_id}';"
    result = SqlRunner.run(sql)
    return result.first()
  end
end
binding.pry
nil
# select * from owners o INNER JOIN animals a ON o.animal_id = a.id;