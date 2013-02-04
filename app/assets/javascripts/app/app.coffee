"use strict"

angular.module("Person8", [])
  .config [
    "$routeProvider"
    "$locationProvider"
    ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode true
      $routeProvider
        .when "/",
          templateUrl: "/posts/index?partial=true"
          controller: "PostsController"
        .when "/posts/show",
          templateUrl: "/posts/show?partial=true"
        .otherwise
          redirectTo: "/"
  ]
