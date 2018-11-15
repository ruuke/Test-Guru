class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :answer, presence: true
  validate :validate_numbers_of_answers

  def validate_numbers_of_answers
    errors.add(:question_id) if count_question_id_uniq(question_id) > 4
  end

  def count_question_id_uniq(id)
    Answer.where(question_id: id).pluck(:question_id).length
  end
end
