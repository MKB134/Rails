class TestPassage < ApplicationRecord
  SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :badges, through: :badges_users
  has_many :badges_users, dependent: :delete_all

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_update :before_update_check_time_limit

  scope :sucessful, -> { where(sucessful: true) }

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
    self.sucessful = true if success?
    save!
  end

  def time_left
    (created_at.to_i + test.timer) - Time.current.to_i
  end

  def timer_in_seconds
    test.timer * 60
  end

  def question_number
    test.questions.where('id <= ?', current_question.id).count
  end


private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_update_check_time_limit
    return unless test.time_limited?

    self.current_question = nil if time_left <= 0
  end
end
