class CreateSubfreds < ActiveRecord::Migration[5.0]
  def change
    create_table :subfreds do |t|
      t.string :name

      t.timestamps
    end
  end
end
