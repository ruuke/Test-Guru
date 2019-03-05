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
  has_and_belongs_to_many :badges

  validates :email, uniqueness: true, format: { with: /.+@.+\..+/i }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def tests_passage(title, level)
    Test
      .joins(:test_passages)
      .where(test_passages: {user_id: id})
      .where('tests.title = ?', title)
      .where('tests.level = ?', level)
  end

  def tests_passage_by_category(category)
    Test
      .joins(:test_passages)
      .where(test_passages: {user_id: id, success: true})
      .joins(:category)
      .where('categories.title = ?', category)
  end

  def tests_passage_by_level(level)
    Test
      .joins(:test_passages)
      .where(test_passages: {user_id: id, success: true})
      .by_level(level)
  end
  
  def admin?
    is_a?(Admin)
  end

end
