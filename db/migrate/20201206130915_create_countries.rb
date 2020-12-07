class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.decimal :la
      t.decimal :lo

      t.timestamps
    end
  end
end
