class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', optional: true

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> {where(level: 5..Float::INFINITY)}

  validates :level, numericality: { only_integer: true }
  validates :title, presense: true, uniqueness: { scope: :level }

  def self.titles_by_category(category_name)
    Test
      .joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
