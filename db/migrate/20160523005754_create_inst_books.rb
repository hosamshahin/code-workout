class CreateInstBooks < ActiveRecord::Migration
  def change
    create_table :inst_books do |t|
      t.integer  "course_offering_id", limit: 4,  null: false
      t.integer  "inst_book_owner_id", limit: 4,  null: false
      t.string   "title",              limit: 50, null: false
      t.string   "book_url",           limit: 80, null: false

      t.timestamps
    end

  end
end
