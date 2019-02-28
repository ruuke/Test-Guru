class BadgeAwardsService

  FIRST_TRY = 1
  USER_HAS_NOT_BACKEND_MASTER_BADGE = 0
    
  def initialize(test_passage)
    @test_passage = test_passage
    @title = test_passage.test.title
    @level = test_passage.test.level
  end

  def call
    badge_first_try_valid?
    badge_backend_master_valid?
  end  

  def badge_first_try_valid?
    if @test_passage.user.tests_passage(@title, @level).length == FIRST_TRY && test_passed?
      user_badges << Badge.first
    end
  end

  def badge_backend_master_valid?
    if count_user_backend_uniq_tests && user_not_backend_master? && test_passed?
      user_badges << Badge.last
      controller.flash[:notice] = 'Backend master'
    end
  end

  def test_passed?
    @test_passage.success?
  end

  def user_not_backend_master?
    @test_passage.user.badges.find_by(title: 'Backend master') == nil
  end

  def count_user_backend_uniq_tests
    @test_passage.user.backend_tests_passage.uniq.length == Test.joins(:category).where('categories.title = ?', 'Backend').length
  end

  def user_badges
    @test_passage.user.badges
  end
  
end
