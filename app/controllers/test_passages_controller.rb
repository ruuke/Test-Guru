class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  before_action :check_timer, only: :update

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
      badge_award if @test_passage.success?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def badge_award
    badges = BadgeAwardsService.new(@test_passage).call
    return if badges.blank?
    current_user.badges.push(badges)
    flash[:notice] = "Вы получили награду!"    
  end

  def check_timer
    if @test_passage.test.duration && @test_passage.overtime?(@test_passage.end_time)
      redirect_to result_test_passage_path(@test_passage)
    end
  end

end
