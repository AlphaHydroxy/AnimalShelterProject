require_relative '../db/sql_runner'
# require 'pry-byebug'

class Owner
  attr_accessor :id, :first_name, :last_name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    # @animal = options['animal']
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING *;"
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

  def self.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

  def find_owner()
    sql = "SELECT * FROM animals WHERE animals.id = '#{@animal_id}';"
    result = SqlRunner.run(sql)
    return result.first()
  end
end

#only shows owners name
# SELECT owners.first_name FROM owners INNER JOIN adoptions ON owners.id = adoptions.owner_id WHERE animal_id = 2;
