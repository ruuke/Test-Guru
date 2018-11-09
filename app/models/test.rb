class Test < ApplicationRecord
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :user, optional: true
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category_title(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where('categories.title = ?', category_title)
    .order('tests.title DESC')
    .pluck(:title)   
  end
end
