Meteor.startup () ->
  Uploader.finished = (index, file) -> 
    Session.set('fileupload', file)