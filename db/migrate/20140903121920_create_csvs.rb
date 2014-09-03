class CreateCsvs < ActiveRecord::Migration
  def change
    create_table :csvs do |t|
      t.string :name
      t.file :language
      t.bool :enabled

      t.timestamps
    end
  end
end
