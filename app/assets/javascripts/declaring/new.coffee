jQuery ->
  $('#new_declaring').sisyphus();

  $('#declaring_city_council_name').autocomplete
    source: $('#declaring_city_council_name').data('autocomplete-source'),
    messages:
      noResults: '',
      results: ->
        ''

  $('#declaring_person_name').autocomplete
    source: $('#declaring_person_name').data('autocomplete-source'),
    messages:
      noResults: '',
      results: ->
        ''

  $('#declaring_position_name').autocomplete
    source: $('#declaring_position_name').data('autocomplete-source'),
    messages:
      noResults: '',
      results: ->
        ''

