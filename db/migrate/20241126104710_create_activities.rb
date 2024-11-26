class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :teacher
      t.string :type
      t.string :address
      t.integer :limit
      t.datetime :event_time
      t.integer :duration
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
