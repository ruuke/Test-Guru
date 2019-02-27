class BadgeAwardsService

  def initialize(test_passage)
    @test_passage = test_passage
    @title = test_passage.test.title
    @level = test_passage.test.level
  end

  def call
    badge_validation(@test_passage)
  end

  def badge_validation(test_passage)
    if @test_passage.badge_first_try(@title, @level)
      @test_passage.user.badges << Badge.first
    end
  end

end
