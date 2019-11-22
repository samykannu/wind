class Article < ApplicationRecord
  validates :title,:content, presence: true
  has_and_belongs_to_many :categories
  has_many :comments, as: :commentable
end
