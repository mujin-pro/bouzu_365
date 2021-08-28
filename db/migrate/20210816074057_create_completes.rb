class CreateCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :completes do |t|

      t.text :activities
      t.timestamps
      t.references :user,   null: false, foreign_key: true
    end
  end
end
