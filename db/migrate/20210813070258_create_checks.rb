class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.integer :skip
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
