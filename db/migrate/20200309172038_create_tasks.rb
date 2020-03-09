class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :pending, default: false

      t.timestamps
    end
  end
end
