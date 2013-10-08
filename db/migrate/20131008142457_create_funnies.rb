class CreateFunnies < ActiveRecord::Migration
  def change
    create_table :funnies do |t|
      t.string :title
      t.integer :user_id
      t.attachment :pic

      t.timestamps
    end
  end
end
