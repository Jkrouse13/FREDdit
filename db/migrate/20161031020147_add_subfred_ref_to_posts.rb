class AddSubfredRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :subfred, foreign_key: true
  end
end
