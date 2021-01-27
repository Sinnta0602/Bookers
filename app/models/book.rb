class Book < ApplicationRecord
  validates :title,length: { minimum: 1, maximum: 10 } ,presence: true
  validates :body, presence: true
end
