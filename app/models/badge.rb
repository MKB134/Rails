class Badge < ApplicationRecord
  has_many :test_passages_badges, dependent: :delete_all
  has_many :test_passages, through: :test_passages_badges
  has_many :tests, through: :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :rule, presence: true
  validates :value, presence: true, unless: :first_attempt_rule?

  module Rule
    CATEGORY = 1
    FIRST_ATTEMPT = 2
    LEVEL = 3

    ALL = [CATEGORY, FIRST_ATTEMPT, LEVEL].freeze

    LABEL_BY_CODE = {
      CATEGORY => 'Выдать бэйдж после успешного прохождения всех тестов из категории',
      FIRST_ATTEMPT => 'Выдать бэйдж после успешного прохождения теста с первой попытки',
      LEVEL => 'Выдать бэйдж после успешного прохождения всех тестов уровня',
    }.freeze

    NAME_BY_CODE = {
      CATEGORY => :category_rule,
      FIRST_ATTEMPT => :first_attempt_rule,
      LEVEL => :level_rule,
    }.freeze

    def self.all
      ALL.collect { |i| OpenStruct.new(id: i, label: LABEL_BY_CODE[i]) }
    end
  end

  def rule_label
    Rule::LABEL_BY_CODE.fetch(rule, '')
  end

  def rule_name
    Rule::NAME_BY_CODE.fetch(rule)
  end

  def category_rule?
    rule == Rule::CATEGORY
  end

  def first_attempt_rule?
    rule == Rule::FIRST_ATTEMPT
  end

  def level_rule?
    rule == Rule::LEVEL
  end
end
