class CreateGates < ActiveRecord::Migration[7.0]
  def change
    create_table :gates do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :enter, index: true, null: false

      t.timestamps
    end
  end
end
