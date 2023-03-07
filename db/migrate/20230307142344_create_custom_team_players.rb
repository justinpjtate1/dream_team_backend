class CreateCustomTeamPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_team_players do |t|
      t.references :custom_team, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
