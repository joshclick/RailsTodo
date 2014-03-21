class CreateTaskVersions < ActiveRecord::Migration
  def change
    create_table :task_versions do |t|
      t.integer   :task_id, :version, :user_id
      t.string    :todo_text
      t.datetime  :completed

      t.timestamps
    end
  end
end
