class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    @question = @test.questions.create(question_params)
    redirect_to test_path(@test)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to test_path
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
