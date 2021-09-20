class CreateFunctionNorms < ActiveRecord::Migration[6.0]
  def change
    create_table :function_norms do |t|
      t.string :function_name
      t.integer :value
      t.references :bop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
