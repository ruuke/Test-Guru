class Feedback < ApplicationRecord
  SUBJECTS = ['Problem', 'Suggestion', 'Question', 'Other']

  def self.subjects
    SUBJECTS
  end
  belongs_to :user

  validates :comment, presence: true
end
