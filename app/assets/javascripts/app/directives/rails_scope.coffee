"use strict"

angular.module("Person8")
  .directive "railsScope", [ 
    ->
      restrict: "E"
      link: (scope, elm, attrs) ->
        try
          content = $(elm).text()
          
          $.extend(scope, JSON.parse(content))
  ]
