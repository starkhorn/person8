"use strict"

angular.module("Person8", [])
  .config ["$routeProvider", ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "posts/index"
      .otherwise
        redirectTo: "/"
  ]
