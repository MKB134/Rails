class Test < ApplicationRecord

  def self.titles_by_category(category_name)
    categories = Category.where(category: category_name)
    categories_ids = categories.map do |abcd|
      abcd.id
    end
    tests = Test.all.where(category_id: categories_ids).order(title: :DESC).map { |test| test.title }
  end
end
