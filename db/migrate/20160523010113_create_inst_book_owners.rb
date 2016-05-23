class CreateInstBookOwners < ActiveRecord::Migration
  def change
    create_table :inst_book_owners do |t|
      t.integer  "user_id",      limit: 4, null: false
      t.integer  "book_role_id", limit: 4, null: false

      t.timestamps
    end
  end
end
