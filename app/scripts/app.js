'use strict';

/**
 * @ngdoc overview
 * @name thecorrespondentApp
 * @description
 * # thecorrespondentApp
 *
 * Main module of the application.
 */
angular
  .module('thecorrespondentApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ngCkeditor'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/pagemanager.html',
        controller: 'PageManagerCtrl',
        controllerAs: 'pagemanager'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
