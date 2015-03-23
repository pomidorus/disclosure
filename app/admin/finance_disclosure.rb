ActiveAdmin.register FinanceDisclosure do

  menu priority: 1

  permit_params :submitted, :official_id, :year,
                incomes_attributes: [:amount_kopiyok], general_income_attributes: [:amount_hryvna]

  index do
    id_column
    column :year
    column :official
    column :general_income
    column :submitted do |finance_disclosure|
      link_to_unless finance_disclosure.submitted.nil?, finance_disclosure.submitted, [:admin, finance_disclosure ]
    end
    actions
  end

  show do
    attributes_table do
      table_for finance_disclosure.general_income do
        column "General Доход" do |general_income|
          link_to general_income.amount_hryvna, [ :admin, general_income ]
        end
      end
      table_for finance_disclosure.incomes do
        column "Доход" do |income|
          link_to income.amount, [ :admin, income ]
        end
      end
      row :submitted
    end
  end

  form do |f|
    f.inputs "Добавление/Редактирование декларации" do
      f.input :year, label: 'Декларируемый год'
      f.input :submitted, label: 'Дата подачи декларации'
      f.input :official, label: 'Декларант'
    end
    f.inputs "Общий доход", for: [:general_income, f.object.general_income || Income.new] do |general_income_form|
      general_income_form.input :amount_hryvna
    end
    f.inputs "Ведомости про доходы" do
      f.has_many :incomes, heading: 'Доход', allow_destroy: true, new_record: true do |i|
        i.input :amount_kopiyok
      end
    end
    f.actions
  end

  filter :submitted
end
