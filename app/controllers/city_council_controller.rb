class CityCouncilController < ApplicationController
  before_filter :find_city_council, only: [:show]

  def show
    @disclosures = FinanceDisclosure.includes(official: [:person, :position, :city_council]).where(:officials => {city_council_id: @city_council.id}).personal_all
    @max_general_income = (@disclosures.map {|disclosure| disclosure.general_income_value}).max
    @max_general_income = 1 if @max_general_income == 0
  end

private

  def find_city_council
    @city_council = CityCouncil.find_by_slug!(params[:id])
  end
end
