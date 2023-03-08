class AddColumnToCustomTeamPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :custom_team_players, :position, :string
  end
end
