class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :todo_text, :limit => 512
      t.datetime :completed

      t.timestamps
    end
  end
end
