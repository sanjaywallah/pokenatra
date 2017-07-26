require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

#load file to connect to db
require_relative 'db/connection'

#load models
require_relative 'models/pokemon'

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemon/index"
end

get '/pokemons/new' do
  erb :"pokemon/new"
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get '/pokemons/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get '/pokemons/:id/delete' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/delete"
end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons"
end
