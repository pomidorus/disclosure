ActiveAdmin.register Income do
  belongs_to :finance_disclosure, optional: true
  menu priority: 3
  permit_params :amount_kopiyok, :finance_disclosure_id

  index do
    id_column
    column :finance_disclosure
    column :amount
    actions
  end
end
