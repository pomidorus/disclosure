class MainController < ApplicationController
  def index
    @disclosures = FinanceDisclosure.all
    @max_general_income = (@disclosures.map {|disclosure| disclosure.general_income_value}).max
  end
end
