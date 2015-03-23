ActiveAdmin.register Person do
  menu priority: 4
  permit_params :full_name

  index do
    column :full_name do |person|
      link_to person.full_name, [:admin, person ]
    end
    actions
  end

  show do
    attributes_table do
      row :full_name
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
