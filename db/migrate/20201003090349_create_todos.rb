class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :value
      t.boolean :done
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :todos 
  end
end
