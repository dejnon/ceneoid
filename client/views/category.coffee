Template.category.helpers
  editing: -> Session.get('editing') == @_id
 
Template.category.events
  "click .edit": (e, tpl) ->
    e.preventDefault()
    Session.set('editing', @_id)
 
  "submit form.form-edit": (e, tpl) ->
    e.preventDefault()
 
    categoryName = tpl.$("input[name='name']").val()
    if categoryName.length
      Categories.update(@_id, $set: {name: categoryName})
      Session.set('editing', null)
 
  "click .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set('editing', null)
 
  "click .remove": (e, tpl) ->
    e.preventDefault()
    Categories.remove(@_id)