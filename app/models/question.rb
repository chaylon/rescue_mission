class Question < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
  validates :title, length: {minimum: 3}
  validates :details, length: {minimum: 10}

  has_many :answers
end
