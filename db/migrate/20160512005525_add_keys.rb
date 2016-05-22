class AddKeys < ActiveRecord::Migration
  def change
    # add_foreign_key "course_enrollments", "course_offerings", name: "course_enrollments_course_offering_id_fk"
    # add_foreign_key "course_enrollments", "course_roles", name: "course_enrollments_course_role_id_fk"
    # add_foreign_key "course_enrollments", "users", name: "course_enrollments_user_id_fk"
    # add_foreign_key "course_offerings", "courses", name: "course_offerings_course_id_fk"
    # add_foreign_key "course_offerings", "terms", name: "course_offerings_term_id_fk"
    # add_foreign_key "courses", "organizations", name: "courses_organization_id_fk"
    # add_foreign_key "identities", "users", name: "identities_user_id_fk"
    # add_foreign_key "users", "global_roles", name: "users_global_role_id_fk"
    add_foreign_key "users", "time_zones", name: "users_time_zone_id_fk"
  end
end

