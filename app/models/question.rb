class Question < ApplicationRecord
  belongs_to :test

  validates :body, presence: true

  has_many :answers, dependent: :destroy
end
