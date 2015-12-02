class PokemonsController < ApplicationController

  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer = current_trainer
    @pokemon.save
    redirect_to root_path
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    @pokemon.save
    redirect_to trainer_path(current_trainer)
  end

  def heal
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health += 10
    @pokemon.save
    redirect_to trainer_path(current_trainer)
  end

  def new
    @pokemon = Pokemon.new()
  end

  def create
    @pokemon = Pokemon.new(name:params[:pokemon][:name], level:1, health:100, trainer:current_trainer)
    if @pokemon.save
      redirect_to trainer_path(current_trainer)
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      render :new
    end
  end

end
