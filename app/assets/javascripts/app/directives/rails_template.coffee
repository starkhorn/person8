"use strict"

angular.module("Person8")
  .directive "railsTemplate", [ 
    ->
      restrict: "EC"
      link: (scope, elm, attrs) ->
        $(elm).remove()
  ]
