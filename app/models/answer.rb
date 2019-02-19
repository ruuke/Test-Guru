class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_numbers_of_answers, on: :save

  def validate_numbers_of_answers
  	message = "кол-во ответов может быть не больше 4-х"
    errors.add(:question, message) if question.answers.count >= 4
  end  
end
