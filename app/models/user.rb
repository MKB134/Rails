class User < ApplicationRecord
  def corses_by_level(level)
    has_many :results
    has_many :tests, through: :results

    Test
      .joins("JOIN results ON tests.id = results.test_id")
      .where(results: {user_id: self.id}, tests: {level: level})
  end
end
