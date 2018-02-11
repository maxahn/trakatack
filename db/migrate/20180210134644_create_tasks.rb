class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :description, null: false 
      t.boolean :active, default: true
      t.integer :score           #there should be no score till task is no longer active
      t.integer :priority
      t.boolean :repeating, default:false 
      t.timestamps
    end
  end
end
