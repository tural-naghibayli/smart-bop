class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :pressure_test, dependent: :destroy
  belongs_to :function_test, dependent: :destroy
end
