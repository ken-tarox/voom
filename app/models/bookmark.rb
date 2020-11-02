class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :onsenpost
  validates :user_id, presence: true
  validates :onsenpost_id, presence: true
  # validates_uniqueness_of :onsenpost_id, scope: :user_id
end
