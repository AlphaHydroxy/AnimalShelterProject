require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/animals'
require_relative './models/owners'
require_relative './models/adoptions'
require_relative './models/adoptionsRepository'

get '/home' do
  erb(:home)
end

get '/animals' do
  @animals = Animal.all()
  erb(:index)
end

get '/adopt' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:adopt)
end

get '/owners' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:owners)
end

get '/contact' do
  erb(:contact)
end

post '/adopt/new' do
  @adopt = Adoption.new(params)
  @adopt.save()
  redirect to "/adoptions"
end 

get '/adoptions' do
  @animal = Animal.all
  @owner = Owner.all
  @adoptions = Adoption.all
  erb(:adoptions)
end

get '/owner/:id' do
  @owner = Owner.find(params[:id])
  erb(:show_owner)
end

get '/owner/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:edit_owner)
end

post '/owner/:id' do
  @owner = Owner.find(params[:id])
  @owner.update(params)
  redirect to "/owners"
end

post '/owner/:id/delete' do
  @owner = Owner.find(params[:id])
  @owner.delete()
  redirect to "/owners"
end  

post '/owner/:id' do
  @owners = Owner.new(params)
  @owners.save()
  redirect to "/owners"
end

post '/owners' do
  @owners = Owner.new(params)
  @owners.save()
  erb(:registered)
end



