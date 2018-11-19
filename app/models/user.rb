class User < ApplicationRecord
	has_many :created_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify
	has_many :test_passages
	has_many :tests, through: :test_passages


  def tests_passage(level)
    Test
      .joins('JOIN test_passages ON tests.id = test_passages.test_id')
      .where(test_passages: {user_id: id})
      .where(level: level)
  end
end
