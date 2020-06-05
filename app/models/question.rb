class Question < ApplicationRecord
  belongs_to :assessment
  has_many :variants, dependent: :destroy
  validates :text, presence: true
end
