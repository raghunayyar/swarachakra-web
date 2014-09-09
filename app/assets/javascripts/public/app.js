(function() {
  var app;

  app = angular.module("Swarachakra", ["ngAnimate", "restangular", "ngRoute"]);

  app.controller("HomeController", [
    "$scope", "Restangular", "LanguageModel", function($scope, Restangular, LanguageModel) {
      var languageResource;
      $scope.languages = LanguageModel.getAll();
      languageResource = Restangular.one("swarachakra").one("languages");
      languageResource.getList("enabled").then(function(languages) {
        LanguageModel.addAll(languages);
      });
    }
  ]);

  app.factory("LanguageModel", function() {
    var LanguageModel;
    LanguageModel = function() {
      this.languages = [];
      this.languageid = {};
    };
    LanguageModel.prototype = {
      add: function(language) {
        this.languages.push(language);
      },
      getAll: function() {
        this.calendars;
      }
    };
    return new LanguageModel();
  });

}).call(this);
