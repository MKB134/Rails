class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :validates_max_answers
  
  def validates_max_answers
    errors.add(:amount) if question.answers.count >= 4
  end
end
