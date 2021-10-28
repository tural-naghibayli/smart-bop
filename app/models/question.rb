class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :function_test_answers, dependent: :destroy
end
