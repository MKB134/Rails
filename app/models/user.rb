class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :confirmable,
         :validatable

  has_many :gists, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :badges_users, dependent: :destroy
  has_many :badges, through: :badges_users
  has_many :author, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  def show_passed_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests?(test_ids)
    passed_test_ids = test_passages.where(test_id: test_ids).select(&:success?).map(&:test_id)
    test_ids.uniq.sort == passed_test_ids.uniq.sort
  end
end
