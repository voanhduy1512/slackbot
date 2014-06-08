# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:load ready", ->
  editor = ace.edit("code-editor")
  if editor
    editor.setTheme("ace/theme/github")
    editor.getSession().setMode('ace/mode/ruby')

  params_editor = ace.edit("params-editor")
  if params_editor
    params_editor.setTheme("ace/theme/github")
    params_editor.getSession().setMode('ace/mode/json')
    params_editor.setReadOnly(true)
  return
