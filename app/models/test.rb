class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :user
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true

  validates :level, numericality: { only_integer: true, greater_than_or_equel_to: 0}
  validate :validate_max_level

  default_scope { order(created_at: :desc) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :by_category_title, -> (title) {  joins('JOIN categories ON tests.category_id = categories.id')
                                          .where('categories.title = ?', title)
                                          .order('tests.title DESC')
                                          .pluck(:title)  }

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
end
