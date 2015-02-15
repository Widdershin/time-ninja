class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.string :name
      t.datetime :start
      t.integer :duration
      t.belongs_to :activity

      t.timestamps
    end
  end
end
