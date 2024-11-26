class CreateClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :details
      t.string :address
      t.string :instagram_link
      t.string :phone_number
      t.string :IBAN
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
