class CastedVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :funny
  attr_accessible :funny, :value, as: :admin
end
