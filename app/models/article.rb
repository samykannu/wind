class Article < ApplicationRecord
  include ArticleConcern
  enum status: [:published,:unpublished]
  validates :title,:content,:status, presence: true
  has_and_belongs_to_many :categories
  has_many :comments, as: :commentable
end
