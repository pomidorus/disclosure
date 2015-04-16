ActiveAdmin.register Person do
  config.sort_order = 'full_name_asc'
  filter :full_name
  menu priority: 0
  permit_params :full_name

  index do
    column :full_name do |person|
      link_to person.full_name, [:admin, person ]
    end
    column :city_council
    actions
  end

  show do
    attributes_table do
      row :full_name
    end
  end
end
