class PlayersController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    before_action :authenticate_devise_api_token!, only: [:show]

    def index
        @players = Player.joins(:club).select("players.id", "players.player_name", "clubs.club_name", "players.position", "players.dob").all
        render json: @players
    end

    def show
        @player = Player.joins(:club).select("players.id", "players.player_name", "clubs.club_name", "players.position", "players.dob").find(params[:id])
        render json: @player
    end
end
