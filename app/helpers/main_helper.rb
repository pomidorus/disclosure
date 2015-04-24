module MainHelper
  include PersonHelper
  BOX_WIDTH_100 = 200

  def box_width(disclosure, income)
    (BOX_WIDTH_100*disclosure.send(income))/@max_income
  end

  def income(disclosure, income)
    number_with_delimiter(disclosure.send(income), delimiter: ' ')
  end

  def deklarant_surname(disclosure)
    surname(disclosure.official_name)
  end

  def deklarant_imya_otchestvo(disclosure)
    imya_otchestvo(disclosure.official_name)
  end

  def posada(disclosure)
    disclosure.official_position
  end

  def city_council(disclosure)
    disclosure.city_council
  end
end
