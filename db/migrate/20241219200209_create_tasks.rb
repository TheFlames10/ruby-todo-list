class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :priority

      t.timestamps
    end
  end
end
