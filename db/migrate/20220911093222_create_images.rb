class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :shop_name
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
