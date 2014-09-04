class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :path
      t.boolean :enabled

      t.timestamps
    end
  end
end
