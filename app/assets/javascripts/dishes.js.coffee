# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$().ready ->
    $("form.edit_dish input").bind(
        "keyup": (e) ->
            if e.keyCode is 13 and not e.shiftKey
                $(this).closest('form').submit()
        ,"blur": ->
            $(this).closest("form").submit()
    )