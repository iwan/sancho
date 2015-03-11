# Datepicker settings (http://bootstrap-datepicker.readthedocs.org/en/release/index.html)
# $('.datepicker').datepicker({
#     format: 'dd/mm/yyyy',
#     startDate: '-3d'
# })

Sancho = 
  requred_field_sign: "*"


sancho_ready = ->
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    lang: $('html').attr('lang')
  })

  add_sign_for_required_field = (el) ->
    label = $("label[for='" + $(el).attr("id") + "']")
    l = label.html()
    if l[l.length-1]!=Sancho.requred_field_sign
      label.html(l+" "+Sancho.requred_field_sign)

  # add asterisk to label when the field is required
  $("input[required='required']").each ->
    add_sign_for_required_field(this)

  $("textarea[required='required']").each ->
    add_sign_for_required_field(this)

  $("select[required='required']").each ->
    add_sign_for_required_field(this)




$(document).ready(sancho_ready)


$ ->
  $("[data-toggle=tooltip]").tooltip()

