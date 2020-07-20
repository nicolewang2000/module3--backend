class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :drink, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
