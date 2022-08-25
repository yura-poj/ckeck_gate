class AddTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string
    remove_column :users, :admin

    add_index :users, :type
    User.update_all(type: 'Child')
  end
end
