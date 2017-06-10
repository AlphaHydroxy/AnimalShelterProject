require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/animals'
require_relative './models/owners'
require_relative './models/adoptions'

get '/home' do
  erb(:home)
end

get '/adopt' do
  @animals = Animal.all()
  erb(:index)
end

get '/contact' do
  erb(:contact)
end

get '/owners' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:owners)
end