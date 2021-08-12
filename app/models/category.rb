class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  default_scope { order(:title) }
end
