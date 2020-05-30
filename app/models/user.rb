class User < ApplicationRecord
  #validate
  # @!scope
  #before_create
  validates :name, uniqueness: true
  validates :last_name, uniqueness: true
end