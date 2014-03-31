class AddVersionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :version, :integer, default: 1
    Task.reset_column_information
    reversible do |dir|
      dir.up { Task.update_all version: 1 }
    end
  end
end
