class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :text
      t.integer :priority
      t.integer :user_id

      t.timestamps
    end
  end
end
