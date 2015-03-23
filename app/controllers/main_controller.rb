class MainController < ApplicationController
  def index
    @disclosures = FinanceDisclosure.all

    @max_general_income = (@disclosures.map {|disclosure| disclosure.general_income_value}).max
    @max_general_income = 1 if @max_general_income == 0
  end
end
