ActiveAdmin.register Income do
  belongs_to :finance_disclosure, optional: true
  menu priority: 2
  permit_params :amount_kopiyok, :finance_disclosure_id, :amount_hryvna

  index do
    id_column
    column :finance_disclosure
    column :amount_hryvna, label: 'Сума доходу, грн'
    actions
  end

  show do
    attributes_table do
      row :finance_disclosure
      row :amount_hryvna
    end
  end

  form do |f|
    f.inputs "Общий доход" do
      f.input :finance_disclosure
      f.input :amount_hryvna
    end
    f.actions
  end

end
