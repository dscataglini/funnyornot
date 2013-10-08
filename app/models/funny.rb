class Funny < ActiveRecord::Base
  attr_accessible :title, :pic
  belongs_to :user
  has_attached_file :pic,
                    :styles => {
                                :medium => "300x300>",
                                :thumb => "100x100>"
                               },
                    :default_url => "/images/:style/missing.png"
  validates :title, length: { minimum: 2 }
  validates :title, presence: true
end