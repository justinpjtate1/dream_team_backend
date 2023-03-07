class CreateCustomTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_teams do |t|
      t.string :team_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
