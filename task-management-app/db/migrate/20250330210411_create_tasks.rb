class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.datetime :due_at
      t.timestamps
    end

    add_index :tasks, :status
    add_index :tasks, :due_at
    add_index :tasks, [:user_id, :status]
  end
end
