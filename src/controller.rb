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
  @adoption = Adoption.all()
  erb(:owners)
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
  redirect to "/owner/#{params[:id]}"
end



post '/owners' do
  @owners = Owner.new(params)
  @owners.save()
  erb(:registered)
end

