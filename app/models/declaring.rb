class Declaring
  include ActiveModel::Model

  attr_accessor :city_council_name, :person_name, :position_name, :year, :general_income_value, :family_general_income_value,
                :city_council, :person, :position, :official, :general_income, :family_general_income

  validates :city_council_name, presence: true
  validates :person_name, presence: true
  validates :position_name, presence: true
  validates :year, presence: true

  def declared
    if valid?
      create_city_council "#{@city_council_name} міська рада"
      create_person @person_name
      create_position @position_name

      create_official @city_council, @person, @position

      create_general_income @general_income_value
      create_family_general_income @family_general_income_value

      create_finance_disclosure official, @year, general_income, family_general_income
    end
  end

  private

  def create_city_council name
    @city_council = CityCouncil.where(name: name).first_or_create!
  end

  def create_person name
    @person = Person.where(full_name: name).first_or_create!
  end

  def create_position name
    @position = Position.where(full: name).first_or_create!
  end

  def create_official city_council, person, position
    @official = Official.where(person: person, position: position, city_council: city_council).first_or_create!
  end

  def create_general_income value
    @general_income = GeneralIncome.create!(amount_hryvna: value)
  end

  def create_family_general_income value
    @family_general_income = FamilyGeneralIncome.create!(amount_hryvna: value)
  end

  def create_finance_disclosure official, year, general_income, family_general_income
    FinanceDisclosure.create!(official: official, year: year, general_income: general_income, family_general_income: family_general_income)
  end
end
