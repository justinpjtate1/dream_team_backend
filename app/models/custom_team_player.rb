class CustomTeamPlayer < ApplicationRecord
  belongs_to :custom_team
  belongs_to :player
end
