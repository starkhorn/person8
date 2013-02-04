"use strict"

angular.module("Person8")
  .directive "railsTemplate", [ 
    ->
      restrict: "EC"
      priority: 10000
      compile: (elm, attrs, transclude) ->
        $(elm).remove()
  ]
