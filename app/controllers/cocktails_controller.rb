class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    params[:cocktail_id].nil? ? @cocktail = Cocktail.find(params[:id]) : @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
    @cocktail.save!
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
