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

  # show do
  #   panel "Incomes" do
  #     table_for finance_disclosure.incomes do
  #       column :amount
  #     end
  #   end
  #   panel "Details" do
  #     table_for finance_disclosure do
  #       column :submitted
  #     end
  #   end
  # end

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
    f.inputs "Add/Edit Disclosure" do
      f.input :submitted
      # f.input :incomes, :as => :check_boxes
    end
    f.inputs "Ведомости про доходы" do
      f.has_many :incomes, heading: 'Доход', allow_destroy: true, new_record: true do |i|
        i.input :amount_kopiyok
      end
    end
    f.actions
  end

  filter :submitted

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
