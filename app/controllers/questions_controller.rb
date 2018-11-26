 class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[edit show destroy update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def edit

  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def show
    
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
