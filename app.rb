require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

#load file to connect to db
require_relative 'db/connection'

#load models
require_relative 'models/pokemon'

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"Pokemon/index"
end

get '/pokemons/poke_type' do
  @pokemons = Pokemon.find(params[:poke_type])
  erb :"pokemon/show"
end

post '/pokemons' do
  @pokemons = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.name}"
end

put '/pokemons/name' do
  @pokemons = Pokemon.find(params[:name])
  @pokemons.update(params[:pokemon])
  redirect("/pokemons/#{@pokemons.name}")
end
