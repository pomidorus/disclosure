ActiveAdmin.register FinanceDisclosure do
  menu priority: 1

  permit_params :submitted, :official_id, :year,
                incomes_attributes: [:amount_kopiyok], general_income_attributes: [:amount_hryvna],
                family_general_income_attributes: [:amount_hryvna]

  index do
    id_column
    column :year
    column :official
    column :general_income
    column :family_general_income
    column :submitted do |finance_disclosure|
      link_to_unless finance_disclosure.submitted.nil?, finance_disclosure.submitted, [:admin, finance_disclosure ]
    end
    actions
  end

  show do
    attributes_table do
      row :year
      row :official
      row :general_income
      row :family_general_income
      row :submitted
    end
  end

  form do |f|
    f.inputs 'Добавление/Редактирование декларации' do
      f.input :official, label: 'Декларант'
      f.input :year, label: 'Декларируемый год'
    end
    f.inputs 'Общий доход', for: [:general_income, f.object.general_income || Income.new] do |general_income_form|
      general_income_form.input :amount_hryvna
    end
    f.inputs 'Общий доход членов семьи', for: [:family_general_income, f.object.family_general_income || Income.new] do |family_general_income_form|
      family_general_income_form.input :amount_hryvna
    end
    f.inputs 'Дополнительные сведения' do
      f.input :submitted, label: 'Дата подачи декларации'
    end
    f.actions
  end

  filter :submitted
end
