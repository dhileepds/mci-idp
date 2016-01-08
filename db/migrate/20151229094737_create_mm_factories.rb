class CreateMmFactories < ActiveRecord::Migration
  def change
    create_table :mm_factories do |t|

      t.timestamps null: false
    end
  end
end
