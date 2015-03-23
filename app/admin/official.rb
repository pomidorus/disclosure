ActiveAdmin.register Official do
  menu priority: 3
  permit_params :person_id, :position_id, :city_council_id

  index do
    column :person do |official|
      link_to official.person_name, [:admin, official ]
    end
    column :position
    column :city_council
    actions
  end

  show do
    attributes_table do
      row :person
      row :position
      row :city_council
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
