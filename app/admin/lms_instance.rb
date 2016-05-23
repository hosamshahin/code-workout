ActiveAdmin.register LmsInstance do
  includes :lms_type
  active_admin_import

  menu parent: 'University-oriented', priority: 220
  permit_params :url, :lms_type_id

  index do
    id_column
    column(:url) { |lms_inst| link_to lms_inst.url, admin_lms_instance_path(lms_inst) }
    column :lms_type
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :lms_type
      f.input :url
    end
    f.actions
  end

end