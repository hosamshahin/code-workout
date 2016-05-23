class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string   "name",               limit: 50,         null: false
      t.string   "short_display_name", limit: 45
      t.string   "ex_type",            limit: 50,         null: false
      t.text     "description",        limit: 4294967295, null: false
      t.timestamps
    end

    add_index :exercises, :name, unique: true
  end
end
