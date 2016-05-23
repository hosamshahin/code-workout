ActiveAdmin.register LmsAccess do
  includes :lms_instance, :user
  active_admin_import

  menu parent: 'University-oriented', priority: 240
  permit_params :lms_instance_id, :user_id, :access_token

  index do
    id_column
    column :lms_instance, sortable: 'lms_instances.url' do |c|
      link_to c.lms_instance.url, admin_lms_instance_path(c.lms_instance)
    end
    column :user, sortable: 'user.display_name' do |c|
      link_to c.user.display_name, admin_user_path(c.user)
    end
    column :access_token do |c|
      link_to c.access_token, admin_lms_access_path(c)
    end
    # column :created_at
    actions
  end

  # show do
  #   attributes_table do
  #     row :id
  #     row :course
  #     row :term
  #     row :label
  #     row(:url) { |c| link_to c.url, c.url }
  #     row :self_enrollment_allowed
  #     row :created_at
  #     row :updated_at
  #   end

  #   panel 'Roster' do
  #     table_for course_offering.students do
  #       column :name, :display_name
  #       column :email
  #     end
  #   end

  # end

  # sidebar 'Instructors', only: :show,
  #   if: proc{ course_offering.instructors.any? } do
  #   table_for course_offering.instructors do
  #     column(:name) { |i| link_to i.display_name, admin_user_path(i) }
  #     column(:email) { |i| link_to i.email, 'mailto:' + i.email }
  #   end
  # end

  # sidebar 'Graders', only: :show,
  #   if: proc{ course_offering.graders.any? } do
  #   table_for course_offering.graders do
  #     column(:name) { |i| link_to i.display_name, admin_user_path(i) }
  #     column(:email) { |i| link_to i.email, 'mailto:' + i.email }
  #   end
  # end

end
