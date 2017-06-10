require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/animals'
require_relative './models/owners'
require_relative './models/adoptions'

get '/animals' do
  @animals = Animal.all()
  erb(:index)
end
