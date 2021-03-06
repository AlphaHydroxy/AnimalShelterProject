require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/animals'
require_relative './models/owners'
require_relative './models/adoptions'

get '/home' do
  erb(:home)
end

get '/animals' do
  @animals = Animal.all()
  erb(:index)
end

get '/animals/ready' do
  @animals = Animal.find(params[:id])
  erb(:ready)
end

get '/adopt' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:adopt)
end

post '/adopt' do
  @animal = Animal.find(params[:id])
  @animal.delete()
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

# get '/admin' do
#   @animals = Animal.all()
#   erb(:admin)
# end

# get '/animal/:id/edit' do
#   @animal = Animal.find(params[:id])
#   erb(:admin)
# end

# post '/animal/:id' do
#   @animal = Animal.find(params[:id])
#   @animal.update(params)
#   redirect to "/admin"
# end

# post '/animal/:id/delete' do
#   @animal = Animal.find(params[:id])
#   @animal.delete()
#   redirect to "/admin"
# end  

# post '/animal/:id' do
#   @animal = Animal.new(params)
#   @animal.save()
#   redirect to "/admin"
# end

