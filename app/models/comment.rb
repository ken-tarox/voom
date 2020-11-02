class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :onsenpost
  validates :comment_content, presence: true, length: { maximum: 1000 }
  default_scope -> { order(created_at: :desc) }
end
