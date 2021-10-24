class ComponentFunctionTest < ApplicationRecord
  belongs_to :function_test, dependent: :destroy
end
