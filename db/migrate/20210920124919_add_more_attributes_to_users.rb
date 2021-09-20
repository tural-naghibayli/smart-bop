class AddMoreAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :position, :string
    add_column :users, :company, :string
    add_column :users, :admin, :boolean
  end
end
