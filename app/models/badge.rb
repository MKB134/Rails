class Badge < ApplicationRecord
  enum rule: { all_tests_from_category: 'AllTestsFromCategory',
               all_tests_passages: 'AllTestsPassages',
               test_first_passage: 'TestFirstPassage' }

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, presence: true
  validates :image, presence: true
end