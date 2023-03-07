class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :player_name
      t.references :club, null: false, foreign_key: true
      t.string :position
      t.date :dob

      t.timestamps
    end
  end
end
