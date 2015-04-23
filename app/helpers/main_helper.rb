module MainHelper
  BOX_WIDTH_100 = 200

  def box_width(disclosure, income)
    (BOX_WIDTH_100*disclosure.send(income))/@max_income
  end

  def income(disclosure, income)
    disclosure.send(income)
  end

  def deklarant_name(disclosure)
    disclosure.official_name
  end

  def posada(disclosure)
    disclosure.official_position
  end

  def city_council(disclosure)
    disclosure.city_council
  end
end
