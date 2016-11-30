class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  def index
    @games = Game.all

    render json: @games
  end

  def show
    render json: Game.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :month, :categorty, :rating, :platform)
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    if @game.update(game_params)
      head :no_content
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy

    head :no_content
  end

  private :set_game, :game_params
end