class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :category_id           , null: false
      t.integer    :condition_id          , null: false
      t.integer    :delivery_cost_id      , null: false
      t.integer    :todouhuken_id         , null: false
      t.integer    :send_schedule_id      , null: false
      t.timestamps
    end
  end
end
