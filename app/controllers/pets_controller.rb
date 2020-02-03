class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do

    @pet = Pet.create(params[:pet])
    if !params[pet[:owner_name]].empty?
      @pet.owner = params[pet[:owner_name]]
      @pet.save
      redirect to "pets/#{@pet.id}"
    else
      redirect '/pets'
    end
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
