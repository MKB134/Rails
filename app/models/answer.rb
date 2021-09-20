class Answer < ApplicationRecord
  belongs_to :question, optional: true

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_max_answers
    errors.add(:base) if question.answers.count >= 4
  end
end
