class AddScoreToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :score, :integer
  end
end
