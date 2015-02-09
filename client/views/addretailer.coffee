Template.addretailer.events
  "submit form.form-create": (e, tpl) ->
    e.preventDefault()
    name = tpl.$("input[name='name']").val()
    if name.length
      Retailers.insert({name: name})

