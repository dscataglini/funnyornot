class AddUpvotesDownvotesNetvotesToFunny < ActiveRecord::Migration
  def change
    add_column :funnies, :upvotes, :integer, default: 0
    add_column :funnies, :downvotes, :integer, default: 0
    add_column :funnies, :netvotes, :integer, default: 0
  end
end
