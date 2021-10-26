class FunctionTestAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :function_test, dependent: :destroy
end
