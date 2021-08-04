class Test < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :author, class_name: 'User', optional: true, dependent: :destroy

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results


  def self.titles_by_category(category_name)
    Test
      .joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
