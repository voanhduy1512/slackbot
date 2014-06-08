# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:load ready", ->
  $("textarea[data-editor]").each ->
    textarea = $(this)
    mode = textarea.data("editor")
    editDiv = $("<div>",
      position: "absolute"
      class: textarea.attr("class")
    ).insertBefore(textarea)
    textarea.css "visibility", "hidden"

    editor = ace.edit(editDiv[0])
    editor.getSession().setValue textarea.val()
    editor.getSession().setMode "ace/mode/" + mode
    context = $(this).data('context')
    if context && mode == 'json'
      editor.getSession().setValue(JSON.stringify(context,null,2))
    editor.setTheme("ace/theme/github");

    # copy back to textarea on form submit...
    textarea.closest("form").submit ->
      textarea.val editor.getSession().getValue()
      return
    return
  return
