class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.text :slug
      t.text :title

      t.timestamps
    end
  end

  def down
    drop_table :lists 
  end
end
