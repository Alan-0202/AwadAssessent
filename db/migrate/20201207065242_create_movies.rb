class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :homepage
      t.string :overview
      t.string :release
      t.decimal :revenue
      t.string :title

      t.timestamps
    end
  end
end
