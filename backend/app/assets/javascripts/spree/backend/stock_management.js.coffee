jQuery ->
  $('.stock_item_backorderable').on 'click', ->
    $(@).parent('form').submit()
  $('.stock_item_track_inventory').on 'click', ->
    $(@).parent('form').submit()
  $('.toggle_stock_item_status').on 'submit', ->
    $.ajax
      type: @method
      url: @action
      data: $(@).serialize()
    false
