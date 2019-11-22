class User < ApplicationRecord
  #has_secure_password
  validates :name, presence: true,uniqueness: true,length:{in: 3..20}
  validates :email,presence: true,uniqueness: true
  validates :password,presence:true
  validates :password,confirmation: true, unless: Proc.new{|a|a.password.blank?}
end
