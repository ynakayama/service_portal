$(document).ready ->
  $('#ac_tab').tabs();

  $("#ac_form").accordion
    collapsible: true
    autoHeight: false
    active: 0
    header: "h3"

  $("#ac_form_general").accordion
    collapsible: true
    autoHeight: false
    active: 0
    header: "h3"
    fillSpace: true
    event: "mouseover"

  $("#ac_form_answer").accordion
    collapsible: true
    autoHeight: false
    active: 0
    header: "h3"

  $("#demand_start_date").datepicker dateFormat: "yy/mm/dd"
  $("#demand_end_date").datepicker dateFormat: "yy/mm/dd"
  $("#books_date_should_contact").datepicker dateFormat: "yy/mm/dd"
