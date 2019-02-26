class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist badge_validation]

  def show

  end

  def result

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options =
      if result.html_url.present?
        current_user.gists.create!(question: @test_passage.current_question, gist_url: result.html_url)
        { notice: t('.success', gist_url: result.html_url) }
      else
        { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      flash[:notice] = 'Badge first try!' if badge_validation
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def badge_validation
    if @test_passage.badge_first_try(@test_passage.test.title, @test_passage.test.level)
      @test_passage.user.badges << Badge.first
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
