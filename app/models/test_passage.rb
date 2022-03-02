class TestPassage < ApplicationRecord
  SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, only: %i[:create :update]

  def complited?
    current_question.nil?
  end

  def success?
    percent >= SUCCESS
  end

  def percent
    self.correct_questions.to_f * 100 / test.questions.count
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def question_number
    test.questions.where('id <= ?', current_question.id).count
  end

private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end
end
