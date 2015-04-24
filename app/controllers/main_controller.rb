class MainController < ApplicationController
  def index
    @disclosures = disclosures.oder_by_personal_general_income

    @max_income = (@disclosures.map {|disclosure| disclosure.general_income_value}).max
    @max_income = 1 if @max_income == 0
  end

  def family_general_income
    @disclosures = disclosures.oder_by_family_general_income
    income_values = @disclosures.map {|disclosure| disclosure.family_general_income_value}

    @max_income = income_values.max
    @max_income = 1 if @max_income == 0
    respond_to do |format|
      format.js { render partial: 'family_general_income'}
    end
  end

  def personal_general_income
    @disclosures = disclosures.oder_by_personal_general_income
    income_values = @disclosures.map {|disclosure| disclosure.general_income_value}

    @max_income =  income_values.max
    @max_income = 1 if @max_income == 0
    respond_to do |format|
      format.js { render partial: 'personal_general_income'}
    end
  end

private

  def disclosures
    FinanceDisclosure.includes(official: [:person, :position, :city_council])
  end
end
