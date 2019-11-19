class Category < ApplicationRecord
  before_validation :alias_add, unless: Proc.new{|a|a.name.blank?}
  validates :name,:alias_name, :presence=>true
  has_and_belongs_to_many :articles
  def alias_add
    self.alias_name = self.name.downcase
  end
end
