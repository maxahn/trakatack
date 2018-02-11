class ChangeEstimationDurationToTasks < ActiveRecord::Migration[5.1]
  def change
    change_column_null :tasks, :estimated_duration, false
  end
end
