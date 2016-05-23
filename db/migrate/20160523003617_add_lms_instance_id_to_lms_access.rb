class AddLmsInstanceIdToLmsAccess < ActiveRecord::Migration
  def change
    add_column :lms_accesses, :lms_instance_id, :integer
    add_column :lms_accesses, :user_id, :integer
    add_foreign_key :lms_accesses, :lms_instances
    add_foreign_key :lms_accesses, :users
  end
end


