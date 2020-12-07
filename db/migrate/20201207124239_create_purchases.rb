class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.string :info
      t.integer :pay

      t.timestamps
    end
  end
end
