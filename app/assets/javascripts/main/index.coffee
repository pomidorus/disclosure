$ ->
  general_income_values = $('.general-income-value .box')
  for general_income_value in general_income_values
    do ->
      box_width = $(general_income_value).data('value')
      $(general_income_value).width(box_width)
