class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :funnies
  has_many :casted_votes
  has_many :voted_funnies, through: :casted_votes, source: :funny

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def owns?(funny)
    funny.user_id == self.id
  end

  def voted?(funny)
    voted_funnies.find_by_id(funny)
  end

  def visitor?
    false
  end

  def upvote(funny)
    return if voted?(funny)
    casted_votes.create({funny: funny, value: 1}, as: :admin )
  end

  def downvote(funny)
    return if voted?(funny)
    casted_votes.create({funny: funny, value: -1}, as: :admin )
  end
end
