ActiveAdmin.register FinanceDisclosure do

  menu priority: 1

  permit_params :submitted, incomes_attributes: [:amount_kopiyok]

  index do
    id_column
    column :submitted do |finance_disclosure|
      link_to finance_disclosure.submitted, [:admin, finance_disclosure ]
    end
    actions
  end

  show do
    attributes_table do
      row :submitted
      table_for finance_disclosure.incomes do
        column "Доход" do |income|
          link_to income.amount, [ :admin, income ]
        end
      end
    end
  end

  form do |f|
    f.inputs "Добавление/Редактирование декларации" do
      f.input :year, label: 'Декларируемый год'
      f.input :submitted, label: 'Дата подачи декларации'
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
