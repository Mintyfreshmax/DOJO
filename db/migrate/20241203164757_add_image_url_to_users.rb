class AddImageUrlToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :image_url, :string
  end
end
