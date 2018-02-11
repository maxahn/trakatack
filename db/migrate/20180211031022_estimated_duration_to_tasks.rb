class EstimatedDurationToTasks < ActiveRecord::Migration[5.1]
  change_table :tasks do |t|
    t.integer :estimated_duration
  end
end
