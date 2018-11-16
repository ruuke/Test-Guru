class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages
  
  def tests_passage(level)
    Test
      .joins(:test_passages)
      .where(test_passages: {user_id: id})
      .where(level: level)
  end

  validates :email, presence: true
end
