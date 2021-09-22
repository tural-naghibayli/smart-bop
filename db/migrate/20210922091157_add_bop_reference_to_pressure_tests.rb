class AddBopReferenceToPressureTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :pressure_tests, :bop, null: false, foreign_key: true
  end
end
