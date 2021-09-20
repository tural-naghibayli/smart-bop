class CreateRegularChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :regular_checks do |t|
      t.string :name
      t.string :value
      t.references :function_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
