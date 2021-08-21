class Category < ApplicationRecord
  default_scope { order(:title) }

  validates :title, presence: true

  has_many :tests, dependent: :nullify
end
