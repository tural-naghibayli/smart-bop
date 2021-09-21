class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :value
      t.string :answerable_type
      t.references :question, null: false, foreign_key: true
      t.references :pressure_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
