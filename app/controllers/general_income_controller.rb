class GeneralIncomeController < ApplicationController
  respond_to :js

  def family
    @disclosures = FinanceDisclosure.includes(official: [:person, :position, :city_council]).family_all
    family_general_income_values = @disclosures.map {|disclosure| disclosure.family_general_income_value}

    @max_general_income = family_general_income_values.max
    @max_general_income = 1 if @max_general_income == 0
    respond_to do |format|
      format.js { render partial: 'family'}
    end
  end

  def personal
    @disclosures = FinanceDisclosure.includes(official: [:person, :position, :city_council]).personal_all
    general_income_values = @disclosures.map {|disclosure| disclosure.general_income_value}

    @max_general_income =  general_income_values.max
    @max_general_income = 1 if @max_general_income == 0
    respond_to do |format|
      format.js { render partial: 'personal'}
    end
  end
end
