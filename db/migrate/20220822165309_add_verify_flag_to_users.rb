class AddVerifyFlagToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :verify, :boolean, null: false, default: false
    add_index :users, :verify

    User.update_all verify: false
  end
end
