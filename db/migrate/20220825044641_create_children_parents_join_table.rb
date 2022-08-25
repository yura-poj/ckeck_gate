class CreateChildrenParentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :children_parents do |t|
      t.references :child, index: true, null: false, foreign_key: { to_table: :users }
      t.references :parent, index: true, null: false, foreign_key: { to_table: :users }
      t.boolean :confirm
    end
  end
end
