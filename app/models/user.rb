class User < ApplicationRecord
  def tests_passage(level)
    Test
      .joins('JOIN test_passages ON tests.id = test_passages.test_id')
      .where('test_passages.user_id = ?', id)
      .where('tests.level = ?', level)
  end
end
