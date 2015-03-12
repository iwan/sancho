# Datepicker settings (http://bootstrap-datepicker.readthedocs.org/en/release/index.html)
# $('.datepicker').datepicker({
#     format: 'dd/mm/yyyy',
#     startDate: '-3d'
# })


$ ->
  $(".dropdown-toggle").dropdown()

  $("[data-toggle=tooltip]").tooltip()

  $("a.open-in-new-tab").click ->
    window.open(this.href)
    false

  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    lang: $('html').attr('lang')
  })

  # add asterisk to label when the field is required
  add_sign_for_required_field = (el) ->
    label = $("label[for='" + $(el).attr("id") + "']")
    l = label.html()
    if l[l.length-1]!=Sancho.requred_field_sign
      label.html(l+" "+Sancho.requred_field_sign)

  $("input[required='required']").each ->
    add_sign_for_required_field(this)

  $("textarea[required='required']").each ->
    add_sign_for_required_field(this)

  $("select[required='required']").each ->
    add_sign_for_required_field(this)
