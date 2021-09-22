class Approval < ApplicationRecord
  belongs_to :pressure_test, dependent: :destroy
  belongs_to :user, dependent: :nullify
end
