class AddBanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ban, :boolean, default: false, null: false
  end
end
