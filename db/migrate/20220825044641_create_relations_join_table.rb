class CreateRelationsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :relations do |t|
      t.references :kid, index: true, null: false
      t.references :parent, index: true, null: false
      t.boolean :confirm, null: false, default: false
      t.boolean :read, index: true, null: false, default: false
      t.string :sender, null: false
    end
  end
end
