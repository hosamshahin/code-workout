class CreateLmsAccesses < ActiveRecord::Migration
  def change
    create_table :lms_accesses do |t|
      t.string :access_token, null: false

      t.timestamps
    end
    add_index :lms_accesses, :access_token, unique: true
  end
end