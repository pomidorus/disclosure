ready = ->
  general_income_values = $('.general-income-value .box')
  for general_income_value in general_income_values
    do ->
      box_width = $(general_income_value).data('value')
      $(general_income_value).width(box_width)

  second_income_values = $('.general-income-value .box-second')
  for second_income_value in second_income_values
    do ->
      box_width = $(second_income_value).data('value')
      $(second_income_value).width(box_width)
      if box_width == 0
        $(second_income_value).remove()

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:update', ready)
