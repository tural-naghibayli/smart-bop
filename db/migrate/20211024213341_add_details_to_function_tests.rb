class AddDetailsToFunctionTests < ActiveRecord::Migration[6.0]
  def change
    add_column :function_tests, :location, :string
    add_column :function_tests, :well_name, :string
  end
end
