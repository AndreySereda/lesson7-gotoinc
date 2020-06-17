class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  validates :name, presence: true
  validates :last_name, presence: true
  validates :name, uniqueness: true
  validates :last_name, uniqueness: true
end