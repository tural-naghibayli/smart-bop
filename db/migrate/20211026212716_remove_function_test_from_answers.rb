class RemoveFunctionTestFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :function_test_id, :bigint
  end
end
