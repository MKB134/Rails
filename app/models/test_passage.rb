class TestPassage < ApplicationRecord
  SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def complited?
    current_question.nil?
  end

  def success?
    percent >= SUCCESS
  end

  def percent
    self.correct_questions * 100 / test.questions.count

  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
    self.correct_questions += 1
  end

    self.current_question = next_question
    save!
  end



private

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end
end
