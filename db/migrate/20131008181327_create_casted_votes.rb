class CreateCastedVotes < ActiveRecord::Migration
  def change
    create_table :casted_votes do |t|
      t.references :user
      t.references :funny
      t.integer :value

      t.timestamps
    end
    add_index :casted_votes, :user_id
    add_index :casted_votes, :funny_id
  end
end
