class DueDateToTasks < ActiveRecord::Migration[5.1]
  change_table :tasks do |t|
    t.datetime :due_date
  end
end
