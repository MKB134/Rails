class User < ApplicationRecord
def corses_by_level(level)
  Test
    .joins("JOIN results ON tests.id = results.test_id")
    .where(results: {user_id: self.id}, tests: {level: level})
    end
end
