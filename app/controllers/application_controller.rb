class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :disclosure_count

  def disclosure_count
    @disclosures_count ||= FinanceDisclosure.count
  end
end
