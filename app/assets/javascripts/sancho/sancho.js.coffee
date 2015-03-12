# Datepicker settings (http://bootstrap-datepicker.readthedocs.org/en/release/index.html)
# $('.datepicker').datepicker({
#     format: 'dd/mm/yyyy',
#     startDate: '-3d'
# })


# $(document).on "page:change", ->

#   $('.datepicker').datepicker({
#     format: 'yyyy-mm-dd',
#     lang: $('html').attr('lang')
#   })

#   # add asterisk to label when the field is required
#   $("input[required='required']").each ->
#     label = $("label[for='" + $(this).attr("id") + "']")
#     l = label.html()
#     if l[l.length-1]!="*"
#       label.html(l+" *")

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
  $("input[required='required']").each ->
    label = $("label[for='" + $(this).attr("id") + "']")
    l = label.html()
    if l[l.length-1]!="*"
      label.html(l+" *")

