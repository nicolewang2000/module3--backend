class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :direction
      t.string :image
      t.string :glass
      t.boolean :alcoholic
    end
  end
end
