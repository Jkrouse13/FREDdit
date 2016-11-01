class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    drop_table :taggings
    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
