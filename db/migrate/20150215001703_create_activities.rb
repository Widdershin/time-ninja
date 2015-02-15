class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :minimum_duration
      t.integer :maximum_duration
      t.integer :desired_amount

      t.belongs_to :user

      t.timestamps
    end
  end
end
