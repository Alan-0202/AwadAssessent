class CreateFictions < ActiveRecord::Migration[6.0]
  def change
    create_table :fictions do |t|
      t.string :name
      t.string :author
      t.string :reviews
      t.string :price
      t.string :year

      t.timestamps
    end
  end
end
