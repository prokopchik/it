class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :short_description, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  searchable do
    text :title, :body, :short_description
  end
end
