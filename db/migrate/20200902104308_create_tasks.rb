class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :ppriority, default: 0
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
