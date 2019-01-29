require 'digest/sha1'

class User < ApplicationRecord

  has_many :created_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, uniqueness: true, format: { with: /.+@.+\..+/i }

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def tests_passage(level)
    Test
      .joins(:test_passages)
      .where(test_passages: {user_id: id})
      .by_level(level)
  end

end
