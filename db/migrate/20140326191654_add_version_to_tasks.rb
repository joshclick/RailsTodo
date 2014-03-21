class AddVersionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :version, :integer, default: 1
  end
end
