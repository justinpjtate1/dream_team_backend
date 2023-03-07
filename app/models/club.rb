class Club < ApplicationRecord
    has_many :users_favorite_clubs
    has_many :users, through: :users_favorite_clubs
    has_many :players
end
