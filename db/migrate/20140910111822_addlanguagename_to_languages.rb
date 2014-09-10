class AddlanguagenameToLanguages < ActiveRecord::Migration
  def change
  	add_column :languages, :languagename, :string
  end
end
