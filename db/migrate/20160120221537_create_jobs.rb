class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :origin
      t.string :destination
      t.string :contneeded
      t.text :cargo
      t.integer :jobcost
      t.references :user, index: true, foreign_key: true
      t.references :boat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
