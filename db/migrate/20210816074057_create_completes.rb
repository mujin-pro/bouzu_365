class CreateCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :completes do |t|

      t.timestamps
    end
  end
end
