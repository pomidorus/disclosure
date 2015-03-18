ActiveAdmin.register Position do
  menu priority: 3
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

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
