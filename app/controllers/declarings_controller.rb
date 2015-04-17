class DeclaringsController < ApplicationController
  respond_to :html

  def new
    @declaring = Declaring.new
  end

  def create
    @declaring = Declaring.new(declaring_params)
    @declaring.declared

    redirect_to add_disclosure_path
  end

  private

  def declaring_params
    params.require(:declaring).permit(:city_council_name, :person_name, :position_name, :year, :general_income_value)
  end
end
