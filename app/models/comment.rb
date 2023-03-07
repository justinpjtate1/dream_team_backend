class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :custom_team
end
