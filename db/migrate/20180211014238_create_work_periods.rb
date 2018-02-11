class CreateWorkPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :work_periods do |t|
      t.belongs_to :task
      t.integer :duration, null: false 
      t.timestamps #created_at time same as start_time
    end
  end
end
