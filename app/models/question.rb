class Question < ApplicationRecord
  belongs_to :assessment
  has_many :variants, dependent: :destroy
  validates :text, presence: true
  accepts_nested_attributes_for :variants, reject_if: :all_blank, allow_destroy: true
end
