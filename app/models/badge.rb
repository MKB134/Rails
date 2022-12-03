class Badge < ApplicationRecord
  enum :rule, { all_tests_from_category: 'AllTestsFromCategory',
             all_tests_passages: 'AllTestsPassages',
             test_first_passage: 'TestFirstPassage' }

  has_many :test_passages_badges, dependent: :delete_all
  has_many :test_passages, through: :test_passages_badges
  has_many :tests, through: :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
end
