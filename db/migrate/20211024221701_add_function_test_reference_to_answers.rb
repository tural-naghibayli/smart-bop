class AddFunctionTestReferenceToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :function_test, foreign_key: true
  end
end
