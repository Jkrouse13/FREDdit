class AddVoteCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :vote_count, :integer
  end
end
