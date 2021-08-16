class Answer < ApplicationRecord
  belongs_to :question, optional: true

  validate :validate_max_answers, on: :create

  def validate_max_answers
    errors.add(:base) if question.answers.count >= 4
  end
end
