class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :variant

  validate :variant_belongs_to_question

  private
  def variant_belongs_to_question
    unless question.variant_ids.include? variants_id
      errors.add(:variant, 'Variant shout belongs to chosen question')
    end
  end
end
