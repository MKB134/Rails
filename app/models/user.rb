class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :author, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :email, presence: true

  def show_passed_by_level(level)
    tests.where(level: level)
  end
end
