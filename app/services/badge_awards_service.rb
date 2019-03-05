class BadgeAwardsService

  RULES = ['first_try', 'backend_master', 'frontend_master', 'level_master']

  def initialize(test_passage)
    @test_passage = test_passage
    @title = test_passage.test.title
    @level = test_passage.test.level
    @category = test_passage.test.category.title
    @user = test_passage.user
  end

  def call
    @badges = []
    RULES.each do # может быть заменить на Badge.pluck(:title).each ?? названия правил = тайтлам
      |title| send ("badge_#{title}_valid?"), title
    end
    @badges   
  end  

  def badge_first_try_valid?(title)
    if @user.tests_passage(@title, @level).length == 1
      @badges << Badge.find_by(title: title)
    end
  end

  def badge_backend_master_valid?(title)
    if count_user_backend_uniq_tests && user_not_category_master?(title)
      @badges << Badge.find_by(title: title)
    end
  end

  def badge_frontend_master_valid?(title)
    if count_user_frontend_uniq_tests && user_not_category_master?(title)
      @badges << Badge.find_by(title: title)
    end
  end

  def badge_level_master_valid?(title)
    if @user.tests_passage_by_level(@level).uniq.length == Test.by_level(@level).length
      @badges << Badge.find_by(title: title)
    end
  end

  def user_not_category_master?(title)
    @user.badges.find_by(title: title) == nil
  end

  def count_user_backend_uniq_tests
    @user.tests_passage_by_category('Backend').uniq.length == Test.by_category_title('Backend').length
  end

  def count_user_frontend_uniq_tests
    @user.tests_passage_by_category('Frontend').uniq.length == Test.by_category_title('Frontend').length
  end

end
