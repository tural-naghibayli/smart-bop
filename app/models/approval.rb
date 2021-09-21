class Approval < ApplicationRecord
  belongs_to :pressure_test
  belongs_to :user
end
