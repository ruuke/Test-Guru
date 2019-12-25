class Badge < ApplicationRecord
  
  BADGE_IMAGE = [ 'badges/candy.png',
                  'badges/cookie.png',
                  'badges/gold_cup.png',
                  'badges/papers.png'
                ]
  
  has_and_belongs_to_many :users

  def self.badge_image
    BADGE_IMAGE
  end

end
