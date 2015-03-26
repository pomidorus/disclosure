class GeneralIncomeController < ApplicationController
  respond_to :js

  def family
    @disclosures = FinanceDisclosure.family_all

    @max_general_income = (@disclosures.map {|disclosure| disclosure.family_general_income_value}).max
    @max_general_income = 1 if @max_general_income == 0
    respond_to do |format|
      format.js { render partial: 'family'}
    end
  end

  def personal
    @disclosures = FinanceDisclosure.personal_all

    @max_general_income = (@disclosures.map {|disclosure| disclosure.general_income_value}).max
    @max_general_income = 1 if @max_general_income == 0
    respond_to do |format|
      format.js { render partial: 'personal'}
    end
  end
end
