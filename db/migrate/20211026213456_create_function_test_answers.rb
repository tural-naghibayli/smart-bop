class CreateFunctionTestAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :function_test_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :function_test, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
