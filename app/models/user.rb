class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :funnies

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

  def visitor?
    false
  end
end
