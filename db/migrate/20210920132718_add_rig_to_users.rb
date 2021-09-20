class AddRigToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :rig, foreign_key: true
  end
end
