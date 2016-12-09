class GamesController < ApplicationController
  before_action :authenticate
  before_action :set_game, only: [:show, :update, :destroy]
  def index
    @games = Game.all

    render json: @games
  end

  def show
    render json: Game.find(params[:id])
  end

  def create
    @game = current_user.games.build(game_params)

    if @game.save
      render json: @game, status: :created
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

  def set_game
    @game = current_user.games.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :month, :category, :rating, :platform)
  end

  private :set_game, :game_params
end
