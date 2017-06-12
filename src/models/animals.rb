require_relative '../db/sql_runner'

class Animal
  attr_accessor :id, :name, :picture, :type, :breed, :age, :date_added, :available
  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @picture = "/picture/#{@name}.png"
    @type = options['type']
    @breed = options['breed']
    @age = options['age'].to_i
    @date_added = options['date_added']
    @available = options['available']
  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, age, date_added, available) VALUES ('#{@name}', '#{@type}', '#{@breed}', #{@age}, '#{@date_added}', '#{@available}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    animals = SqlRunner.run(sql)
    return animals.map{ |animal| Animal.new(animal) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = #{@id};"
    animal = SqlRunner.run(sql)
    return Animal.new(animal.first)
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE animals SET (name, type, breed, age, date_added, available) = ('#{@name}', '#{@type}', '#{@breed}', #{@age}, '#{@date_added}', '#{@available}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def find_available_pets_for_adoption()
    sql = "SELECT * FROM animals WHERE animals.available = '#{@available}';"
    result = SqlRunner.run(sql)
    return result.first()
  end
end