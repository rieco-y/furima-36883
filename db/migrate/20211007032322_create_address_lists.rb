class CreateAddressLists < ActiveRecord::Migration[6.0]
  def change
    create_table :address_lists do |t|
      t.string     :post_num,        null: false
      t.integer    :todouhuken_id,   null: false
      t.string     :city,            null: false
      t.string     :house_num,       null: false
      t.string     :building_name
      t.string     :tel_num,         null: false
      t.references :shopping_list,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
