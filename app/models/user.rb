class User < ApplicationRecord
  
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :email, uniqueness: true, format: { with: /.+@.+\..+/i }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def tests_passage(level)
    Test
      .joins(:test_passages)
      .where(test_passages: {user_id: id})
      .by_level(level)
  end

  def admin?
    is_a?(Admin)
  end

end
