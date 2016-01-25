class CreateFollowboats < ActiveRecord::Migration
  def change
    create_table :followboats do |t|
      t.references :user, index: true, foreign_key: true
      t.references :boat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
