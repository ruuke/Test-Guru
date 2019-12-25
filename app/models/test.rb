class Test < ApplicationRecord
  
  belongs_to :category
  belongs_to :user
  
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  
  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, 
                                    greater_than_or_equel_to: 0}

  validates :duration, numericality: { only_integer: true,
                                       greater_than: 0 }

  
  default_scope { order(created_at: :desc) }
  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :difficult, -> { by_level(5..Float::INFINITY) }
  scope :by_category_title, -> (title) {  joins(:category).where('categories.title = ?', title) }
  
end
