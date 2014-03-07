class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text, :limit => 512
      t.datetime :completion

      t.timestamps
    end
  end
end
