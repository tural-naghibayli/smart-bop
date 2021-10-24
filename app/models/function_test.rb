class FunctionTest < ApplicationRecord
  belongs_to :user
  belongs_to :bop

  has_many :component_function_tests, dependent: :destroy
  accepts_nested_attributes_for :component_function_tests, reject_if: :all_blank, allow_destroy: true
end
