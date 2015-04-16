ActiveAdmin.register Position do
  config.sort_order = 'short_asc'
  filter :short
  menu priority: 1
  permit_params :short, :full

  index do
    column :short do |position|
      link_to position.short, [:admin, position ]
    end
    column :full
    actions
  end

  show do
    attributes_table do
      row :short
      row :full
    end
  end
end
