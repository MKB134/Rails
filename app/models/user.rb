class User < ApplicationRecord
def corses_by_level(level)
  results = Result.where(user_id: self.id).pluck(:test_id)
end
end
