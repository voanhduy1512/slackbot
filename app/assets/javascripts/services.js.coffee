# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:load ready", ->
  if ($('.editor').length > 0)
    textEditor = ace.edit("text-editor")
    textEditor.setTheme("ace/theme/github")
    textEditor.getSession().setMode('ace/mode/ruby')

    attachmentsEditor = ace.edit("attachments-editor")
    attachmentsEditor.setTheme("ace/theme/github")
    attachmentsEditor.getSession().setMode('ace/mode/ruby')

    helpersEditor = ace.edit("helpers-editor")
    helpersEditor.setTheme("ace/theme/github")
    helpersEditor.getSession().setMode('ace/mode/ruby')
  return
