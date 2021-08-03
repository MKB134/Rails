class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
   has_many :author, class_name: 'Test', foreign_key: 'author_id'

  def corses_by_level(level)
    Test
      .joins("JOIN results ON tests.id = results.test_id")
      .where(results: {user_id: self.id}, tests: {level: level})
  end
end
