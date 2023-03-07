class Player < ApplicationRecord
  belongs_to :club
  has_many :custom_teams_players
  has_many :custom_teams, through: :custom_teams_players
end
