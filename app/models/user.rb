class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: '- неверный формат' },
                    uniqueness: true
  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  has_secure_password

  def show_passed_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
