class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :results
  has_many :users, through: :results
  belongs_to :author, class_name: 'User', optional: true

  def self.titles_by_category(category_name)
    Test
      .joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
