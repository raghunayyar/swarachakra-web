(function() {
  var app;

  app = angular.module("Swarachakra", ["ngAnimate", "restangular", "ngRoute"]);

  app.directive("TimeoutChange", [
    "$timeout", function($timeout) {
      return {
        restrict: "A",
        link: function(scope, element, attributes) {
          var interval;
          interval = 300;
          $(element).bind("input propertychange", function() {
            var timeout;
            $timeout.cancel(timeout);
            timeout = $timeout(function() {
              scope.$apply(attributes.TimeoutChange);
            }, interval);
          });
        }
      };
    }
  ]);

  app.controller("AppController", [
    "$scope", "Restangular", "LanguageModel", function($scope, Restangular, LanguageModel) {
      var languageResource;
      $scope.languages = LanguageModel.getAll();
      languageResource = Restangular.one("languages");
      languageResource.getList("enabled").then(function(languages) {
        LanguageModel.addAll(languages);
      });
    }
  ]);

  app.controller("TextareaController", [
    "$scope", "Restangular", function($scope, Restangular) {
      $scope.save = function() {
        var content;
        content = $scope.content;
        console.log(content);
        SaveModel.add(content);
      };
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

  app.factory("SaveModel", [
    "$q", function($q) {
      var SaveModel;
      SaveModel = function() {
        this.queue = {};
        this.flushLock = false;
      };
      SaveModel.prototype = {
        add: function(textinput) {
          this._queue = textinput;
          console.log('meh');
          this.flush();
        }
      };
      return new SaveModel();
    }
  ]);

}).call(this);
