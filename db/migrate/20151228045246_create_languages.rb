class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :language_id
      t.text :controller_name
      t.string :page_name
      t.text :language_property
      t.string :language_type

      t.timestamps null: false
    end
  end
end
