require_relative '../db/sql_runner'

class Adoption
  attr_accessor :id, :owner_id, :animal_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id']
    @animal_id = options['animal_id']
  end

  def save()
    sql = "INSERT INTO adoptions (owner_id, animal_id) VALUES (#{@owner_id}, #{@animal_id}) RETURNING *;"
    adoption = SqlRunner.run(sql).first
    @id = adoption['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    adoption = SqlRunner.run(sql)
    return adoption.map { |adoption|Adoption.new(adoption) }
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = #{id};"
    adoption = SqlRunner.run(sql)
    return Adoption.new(adoption.first)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def animal
    sql = "SELECT * FROM animals a 
    INNER JOIN adoptions ad 
    ON ad.animal_id = a.id 
    WHERE a.id = #{@animal_id}"
    results = SqlRunner.run(sql)
    return Animal.new(results.first)
  end

  def owner
    sql = "SELECT * FROM owners o
    INNER JOIN adoptions ad
    ON ad.owner_id = o.id
    WHERE o.id = #{@owner_id}"
    results = SqlRunner.run(sql)
    return Owner.new(results.first)
  end

end