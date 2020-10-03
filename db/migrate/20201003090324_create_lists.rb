class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :slug
      t.string :title

      t.timestamps
    end
  end

  def down
    drop_table :lists 
  end
end
