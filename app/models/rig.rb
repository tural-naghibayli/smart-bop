class Rig < ApplicationRecord
  has_many :users
  has_one :bop
end
