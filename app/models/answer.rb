class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :answer, presence: true
  validate :validate_numbers_of_answers

  def validate_numbers_of_answers
    errors.add(:question, 'кол-во ответов может быть не больше 4-х') if question.answers.count >= 4
  end  
end
