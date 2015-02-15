ActiveAdmin.register Income do
  belongs_to :finance_disclosure, optional: true
  menu priority: 2
  permit_params :amount_kopiyok, :finance_disclosure_id

  index do
    id_column
    column :finance_disclosure
    column :amount
    actions
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
