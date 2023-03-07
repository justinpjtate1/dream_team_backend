class CreateUsersFavoriteClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :users_favorite_clubs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
