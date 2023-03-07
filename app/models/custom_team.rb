class CustomTeam < ApplicationRecord
  belongs_to :user
  has_many :custom_teams_players
  has_many :players, through: :custom_teams_players
  has_many :comments
end
