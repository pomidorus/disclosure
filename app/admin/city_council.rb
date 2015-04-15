ActiveAdmin.register CityCouncil do
  config.sort_order = 'name_asc'
  menu priority: 0
  permit_params :name

  index do
    column :name do |city_council|
      link_to city_council.name, [:admin, city_council ]
    end
    column "Количество чиновников" do |city_council|
      city_council.officials.size
    end
    column "Количество деклараций" do |city_council|
      city_council.officials_disclosures.size
    end
    actions
  end

  show :title => proc{|city_council| city_council.name } do
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
