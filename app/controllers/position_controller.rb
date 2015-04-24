class PositionController < ApplicationController
  before_filter :find_position, only: [:show]

  def show
    @disclosures = disclosures.oder_by_personal_general_income
    @max_general_income = (@disclosures.map {|disclosure| disclosure.general_income_value}).max
    @max_general_income = 1 if @max_general_income == 0
  end

private

  def find_position
    @position ||= Position.find_by_slug!(params[:id])
  end

  def disclosures
    FinanceDisclosure.includes(official: [:person, :position, :city_council]).where(:officials => {position_id: @position.id})
  end
end
