require_relative '../db/sql_runner'

class Owner
  attr_accessor :id, :first_name, :last_name
  def initialize(options)
    
