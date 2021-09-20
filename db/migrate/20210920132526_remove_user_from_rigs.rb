class RemoveUserFromRigs < ActiveRecord::Migration[6.0]
  def change
    remove_reference :rigs, :user, index: true, foreign_key: true
  end
end
