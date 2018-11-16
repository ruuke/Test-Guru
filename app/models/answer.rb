class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :answer, presence: true
  validate :validate_numbers_of_answers

  def validate_numbers_of_answers
    errors.add(:question) if question.answers.count >= 4
  end  
end
