class CreateAddressLists < ActiveRecord::Migration[6.0]
  def change
    create_table :address_lists do |t|

      t.timestamps
    end
  end
end
