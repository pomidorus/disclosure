# ActiveAdmin.register Official do
#   filter :city_council
#
#   menu priority: 3
#   permit_params :person_id, :position_id, :city_council_id
#
#   index do
#     column :person do |official|
#       link_to official.person_name, [:admin, official ]
#     end
#     column :position
#     column :city_council
#     actions
#   end
#
#   show do
#     attributes_table do
#       row :person
#       row :position
#       row :city_council
#     end
#   end
# end
