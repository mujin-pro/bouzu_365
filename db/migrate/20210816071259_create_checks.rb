class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|

      t.text :activities
      t.timestamps
      t.references :user,   null: false, foreign_key: true
    end
  end
end
