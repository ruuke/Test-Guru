module TestPassagesHelper
  PASS_TEST_PERCENT = 0.85

  def test_result(test_passage)
    if percentage_of_correct_answers >= PASS_TEST_PERCENT
      true
    else
      false
    end
  end

  def percentage_of_correct_answers
    @test_passage.correct_questions.to_f/@test_passage.test.questions.count.to_f
  end
end
