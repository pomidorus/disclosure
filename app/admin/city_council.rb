ActiveAdmin.register CityCouncil do
  menu priority: 5
  permit_params :name

  index do
    column :name do |city_council|
      link_to city_council.name, [:admin, city_council ]
    end
    actions
  end

  show do
    attributes_table do
      row :name
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
