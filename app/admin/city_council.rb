ActiveAdmin.register CityCouncil do
  config.sort_order = 'name_asc'
  menu priority: 1
  permit_params :name

  index do
    column :name do |city_council|
      link_to city_council.name, [:admin, city_council ]
    end
    column "Количество чиновников" do |city_council|
      link_to city_council.officials.size, admin_city_council_officials_path(city_council)
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

  ActiveAdmin.register Official do
    belongs_to :city_council
    config.filters = false

    index do
      column :person do |official|
        link_to official.person_name, admin_city_council_official_path(:city_council, official)
      end
      column :position
      column :city_council
      actions
    end
  end
end
