class TestPassage < ApplicationRecord
  belongs_to :user 
  belongs_to :test

  # scope :by_level, -> (level) { where(level: level) }
end
