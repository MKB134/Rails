class Category < ApplicationRecord
  has_many :tests, dependent: :nullify
end
