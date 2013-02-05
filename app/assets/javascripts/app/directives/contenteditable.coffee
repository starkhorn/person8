"use strict"

angular.module("Person8")
  .directive "contenteditable", [ 
    ->
      restrict: "A"
      link: (scope, elm, attrs) ->
        triggerPlaceholder = (input, isOn) ->
          input = $(input)

          # Bug on chrome prevents cursor from appearing on the first focus
          # Delay setting content temporarily fixes this
          setTimeout ->
            input.text(if isOn then attrs.placeholder else "")
            input.toggleClass("placeholder", isOn)

        $(elm)
          .on "focus", -> 
            triggerPlaceholder(@, false) if $(@).text() is attrs.placeholder
          .on "blur", -> 
            triggerPlaceholder(@, true) if $(@).text() is ""

        triggerPlaceholder(elm, true)
  ]
