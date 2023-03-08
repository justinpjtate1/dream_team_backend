class PlayersController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    before_action :authenticate_devise_api_token!

    def index
        @players = Player.joins(:club).select("players.id", "players.player_name", "clubs.club_name", "players.position", "players.dob").all
        render json: @players
    end

    def show
        @player = Player.joins(:club).select("players.id", "players.player_name", "clubs.club_name", "players.position", "players.dob").find(params[:id])
        render json: @player
    end

    def player_search
        @player = Player.joins(:club).select("players.id", "players.player_name", "clubs.club_name", "players.position", "players.dob").find_by_player_name(params[:name])
        render json: @player
    end

    def club_search
        @players = Player.joins(:club).select("players.id", "players.player_name", "clubs.club_name", "players.position", "players.dob")
        @club = @players.select {|player| player.club_name == params[:name]}
        render json: @club
    end
end
