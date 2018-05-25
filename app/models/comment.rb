class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :article
  belongs_to :parent_comment, required: false, class_name: to_s
  has_many :children_comments, foreign_key: :parent_comment_id, class_name: to_s
end