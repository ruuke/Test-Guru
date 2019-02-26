class TestPassage < ApplicationRecord

  PASS_TEST_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  
  before_validation :before_validation_set_current_question, on: %i[create update]
  

  def success?
    percentage_of_correct_answers >= PASS_TEST_PERCENT
  end

  def percentage_of_correct_answers
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def current_question_index
    test.questions.index(current_question)
  end

  def current_question_number
    current_question_index + 1
  end

  def percentage_of_progress
    (current_question_index.to_f / test.questions.count.to_f) * 100
  end

  private

  def before_validation_set_current_question
    self.current_question = 
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    if answer_ids.present?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      nil
    end
  end

  def correct_answers
    current_question.answers.correct
  end

end
