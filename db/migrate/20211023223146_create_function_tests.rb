class CreateFunctionTests < ActiveRecord::Migration[6.0]
  def change
    create_table :function_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bop, null: false, foreign_key: true
      t.date :last_test_date
      t.date :completed_date
      t.date :next_test_deadline

      t.timestamps
    end
  end
end
