class AddUserIdToDrinks < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :user_id, :integer
  end
end
