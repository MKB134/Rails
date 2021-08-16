class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', optional: true

  validates :title, presense: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> {where(level: 5..Float::INFINITY)}
  scope :by_category, -> (category_name) {
      joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc) }

  def self.titles_by_category(title)
    by_category(title).pluck(:title)
  end
end
