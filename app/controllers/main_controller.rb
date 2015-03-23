class MainController < ApplicationController
  def index
    @disclosures = FinanceDisclosure.all
  end
end
