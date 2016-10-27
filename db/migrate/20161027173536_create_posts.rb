class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :vote
      t.string :title
      t.string :link
      t.string :author

      t.timestamps
    end
  end
end
