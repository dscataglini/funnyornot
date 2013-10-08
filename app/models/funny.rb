class Funny < ActiveRecord::Base
  attr_accessible :title, :pic
  belongs_to :user
  has_many :casted_votes
  has_many :voting_users, through: :casted_votes, source: :user

  has_attached_file :pic,
                    :styles => {
                                :medium => "300x300>",
                                :large => "800x800>"
                               },
                    :default_url => "/images/:style/missing.png"
  validates :title, length: { minimum: 2 }
  validates :title, presence: true

  def upvoted!
    self.upvotes = self.upvotes.succ
    self.netvotes = self.netvotes.succ
    save!
  end

  def downvoted!
    self.downvotes = self.ownvotes.pred
    self.netvotes = self.netvotes.pred
    save!
  end
end
