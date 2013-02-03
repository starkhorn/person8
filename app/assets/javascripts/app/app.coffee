"use strict"

angular.module("Person8", [])
  .config [
    "$routeProvider"
    "$locationProvider"
    ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode true
      $routeProvider
        .when "/",
          templateUrl: "/posts/index"
          controller: "PostsController"
        .when "/posts/show",
          templateUrl: "/posts/show"
        .otherwise
          redirectTo: "/"
  ]
