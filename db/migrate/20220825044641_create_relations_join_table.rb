class CreateRelationsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :relations do |t|
      t.references :sender, index: true, foreign_key: { to_table: :users }
      t.references :addressee, index: true, foreign_key: { to_table: :users }
      t.boolean :confirm, null: false, default: false
      t.boolean :read, index: true, null: false, default: false

      t.timestamps
    end
  end
end
