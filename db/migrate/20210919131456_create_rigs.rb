class CreateRigs < ActiveRecord::Migration[6.0]
  def change
    create_table :rigs do |t|
      t.string :name
      t.string :reservoir_field
      t.string :contractor_drilling_company
      t.string :operator_company


      t.timestamps
    end
  end
end
