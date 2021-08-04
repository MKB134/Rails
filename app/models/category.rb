class Category < ApplicationRecord
  has_many :tests, dependet: :destroy
end
