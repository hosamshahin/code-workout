# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160523003617) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "course_enrollments", force: true do |t|
    t.integer "user_id",            null: false
    t.integer "course_offering_id", null: false
    t.integer "course_role_id",     null: false
  end

  add_index "course_enrollments", ["course_offering_id"], name: "index_course_enrollments_on_course_offering_id", using: :btree
  add_index "course_enrollments", ["course_role_id"], name: "index_course_enrollments_on_course_role_id", using: :btree
  add_index "course_enrollments", ["user_id", "course_offering_id"], name: "index_course_enrollments_on_user_id_and_course_offering_id", unique: true, using: :btree
  add_index "course_enrollments", ["user_id"], name: "index_course_enrollments_on_user_id", using: :btree

  create_table "course_offerings", force: true do |t|
    t.integer  "course_id",               null: false
    t.integer  "term_id",                 null: false
    t.string   "label",                   null: false
    t.string   "url"
    t.boolean  "self_enrollment_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "cutoff_date"
    t.integer  "late_policy_id"
  end

  add_index "course_offerings", ["course_id"], name: "index_course_offerings_on_course_id", using: :btree
  add_index "course_offerings", ["late_policy_id"], name: "course_offerings_late_policy_id_fk", using: :btree
  add_index "course_offerings", ["term_id"], name: "index_course_offerings_on_term_id", using: :btree

  create_table "course_roles", force: true do |t|
    t.string  "name",                                       null: false
    t.boolean "can_manage_course",          default: false, null: false
    t.boolean "can_manage_assignments",     default: false, null: false
    t.boolean "can_grade_submissions",      default: false, null: false
    t.boolean "can_view_other_submissions", default: false, null: false
    t.boolean "builtin",                    default: false, null: false
  end

  create_table "courses", force: true do |t|
    t.string   "name",            null: false
    t.string   "number",          null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "slug",            null: false
  end

  add_index "courses", ["organization_id"], name: "index_courses_on_organization_id", using: :btree
  add_index "courses", ["slug"], name: "index_courses_on_slug", using: :btree

  create_table "errors", force: true do |t|
    t.string   "usable_type"
    t.integer  "usable_id"
    t.string   "class_name"
    t.text     "message"
    t.text     "trace"
    t.text     "target_url"
    t.text     "referer_url"
    t.text     "params"
    t.text     "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "errors", ["class_name"], name: "index_errors_on_class_name", using: :btree
  add_index "errors", ["created_at"], name: "index_errors_on_created_at", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "global_roles", force: true do |t|
    t.string  "name",                                          null: false
    t.boolean "can_manage_all_courses",        default: false, null: false
    t.boolean "can_edit_system_configuration", default: false, null: false
    t.boolean "builtin",                       default: false, null: false
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["uid", "provider"], name: "index_identities_on_uid_and_provider", using: :btree
  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "late_policies", force: true do |t|
    t.string   "name",         null: false
    t.integer  "late_days",    null: false
    t.integer  "late_percent", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "late_policies", ["name"], name: "index_late_policies_on_name", unique: true, using: :btree

  create_table "lms_accesses", force: true do |t|
    t.string   "access_token",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lms_instance_id"
    t.integer  "user_id"
  end

  add_index "lms_accesses", ["access_token"], name: "index_lms_accesses_on_access_token", unique: true, using: :btree
  add_index "lms_accesses", ["lms_instance_id"], name: "lms_accesses_lms_instance_id_fk", using: :btree
  add_index "lms_accesses", ["user_id"], name: "lms_accesses_user_id_fk", using: :btree

  create_table "lms_instances", force: true do |t|
    t.string   "url",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lms_type_id"
  end

  add_index "lms_instances", ["lms_type_id"], name: "lms_instances_lms_type_id_fk", using: :btree
  add_index "lms_instances", ["url"], name: "index_lms_instances_on_url", unique: true, using: :btree

  create_table "lms_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lms_types", ["name"], name: "index_lms_types_on_name", unique: true, using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
    t.string   "slug",         null: false
  end

  add_index "organizations", ["name"], name: "index_organizations_on_name", unique: true, using: :btree
  add_index "organizations", ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree

  create_table "terms", force: true do |t|
    t.integer  "season",     null: false
    t.date     "starts_on",  null: false
    t.date     "ends_on",    null: false
    t.integer  "year",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       null: false
  end

  add_index "terms", ["slug"], name: "index_terms_on_slug", unique: true, using: :btree
  add_index "terms", ["starts_on"], name: "index_terms_on_starts_on", using: :btree
  add_index "terms", ["year", "season"], name: "index_terms_on_year_and_season", using: :btree

  create_table "time_zones", force: true do |t|
    t.string   "name"
    t.string   "zone"
    t.string   "display_as"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "global_role_id",                      null: false
    t.string   "avatar"
    t.string   "slug",                                null: false
    t.integer  "time_zone_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["global_role_id"], name: "index_users_on_global_role_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["time_zone_id"], name: "index_users_on_time_zone_id", using: :btree

  add_foreign_key "course_enrollments", "course_offerings", name: "course_enrollments_course_offering_id_fk", dependent: :delete
  add_foreign_key "course_enrollments", "course_roles", name: "course_enrollments_course_role_id_fk"
  add_foreign_key "course_enrollments", "users", name: "course_enrollments_user_id_fk", dependent: :delete

  add_foreign_key "course_offerings", "courses", name: "course_offerings_course_id_fk", dependent: :delete
  add_foreign_key "course_offerings", "late_policies", name: "course_offerings_late_policy_id_fk"
  add_foreign_key "course_offerings", "terms", name: "course_offerings_term_id_fk", dependent: :delete

  add_foreign_key "courses", "organizations", name: "courses_organization_id_fk", dependent: :delete

  add_foreign_key "identities", "users", name: "identities_user_id_fk", dependent: :delete

  add_foreign_key "lms_accesses", "lms_instances", name: "lms_accesses_lms_instance_id_fk"
  add_foreign_key "lms_accesses", "users", name: "lms_accesses_user_id_fk"

  add_foreign_key "lms_instances", "lms_types", name: "lms_instances_lms_type_id_fk"

  add_foreign_key "users", "global_roles", name: "users_global_role_id_fk"
  add_foreign_key "users", "time_zones", name: "users_time_zone_id_fk"

end
