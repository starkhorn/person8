"use strict"

angular.module("Person8", [])
  .config([
    "$routeProvider"
    "$locationProvider"
    ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode true
      $routeProvider
        .when "/",
          templateUrl: "/posts?partial=true"
          controller: "PostsController"
        .when "/posts/new"
          templateUrl: "/posts/new?partial=true"
        .otherwise
          redirectTo: "/"
  ])
  .run([
    "$rootScope"
    ($rootScope) ->
      $rootScope.$on "$viewContentLoaded", ->
        Mercury = Mercury or null

        if Mercury
          Mercury.trigger "reinitialize"
  ])