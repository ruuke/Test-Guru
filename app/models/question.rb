class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers
end
